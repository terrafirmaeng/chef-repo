package "mod_wsgi"
package "MySQL-python"
package "epel-release"
package "python-pip"

include_recipe "apache"
include_recipe "mysql::server"
include_recipe "unzip"

# get the external file
remote_file "#{Chef::Config[:file_cache_path]}/somefile.zip" do
  source 'https://github.com/colincam/Awesome-Appliance-Repair/archive/master.zip'
end


execute "unzip somefile.zip" do
  cwd Chef::Config[:file_cache_path]
  creates "Awesome-Appliance-Repair-master"
end

execute "cp -R AAR /var/www" do
  cwd "#{Chef::Config[:file_cache_path]}/Awesome-Appliance-Repair-master"
  creates "/var/www/AAR"
end

execute "chown -R apache:apache AAR" do
  cwd "/var/www"
end


execute "pip install flask" do
  creates "/usr/lib/python2.6/site-packages/flask"
end


