connection_info = {
	:host => "localhost",
	:username => 'root',
	:password => 'ilikerandompasswords'
}

include_recipe "mysql-chef_gem"

mysql_database 'run initial creation script' do
  connection connection_info
	database_name "mysql"
  sql { ::File.open("#{Chef::Config[:file_cache_path]}/Awesome-Appliance-Repair-master/make_AARdb.sql").read }
  action :query
end

mysql_database_user 'aarapp' do
	connection connection_info
	privileges [:select,:update,:insert,:create,:delete]
	database_name "AARdb"
	password 'secret'
	action [:create, :grant]
end


