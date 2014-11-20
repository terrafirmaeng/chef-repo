connection_info = {
	:host => "localhost",
    :username => 'root',
    :password => 'ilikerandompasswords'
}

# mysql_database 'AARdb' do
	# connection connection_info
	# action :create
# end

mysql_database 'run initial creation script' do
  connection connection_info
  sql { ::File.open("#{Chef::Config[:file_cache_path]}/Awesome-Appliance-Repair-master/make_AARdb.sql").read }
  action :query
end

mysql_database_user 'aarapp' do
	connection connection_info
	password 'secret'
	action :create
end

mysql_database_user 'aarapp' do
	privileges [:select,:update,:insert,:create,:delete]
	database_name 'foo'
	require_ssl true
	action :grant
end


