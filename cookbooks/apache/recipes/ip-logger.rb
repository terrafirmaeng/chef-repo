

search('node', 'platform:centos').each do |server|
  log "The CentOS servers in your orginization have the following FQDN/IP Addresses: - #{server["fqdn"]}/#{server["ipaddress"]}"
end