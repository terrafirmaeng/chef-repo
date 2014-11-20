template "/etc/httpd/conf.d/aar.conf" do
  source 'source.erb'
  mode '0644'
  notifies :restart, 'service[httpd]'
end

template "/var/www/AAR/AAR_config.py" do
  source 'AAR_Config.py.erb'
  mode '0644'
end