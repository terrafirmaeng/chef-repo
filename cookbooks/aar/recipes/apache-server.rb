template "/etc/httpd/conf.d/aar.conf" do
  source 'source.erb'
  mode '0644'
  notifies :restart, 'service[httpd]'
end