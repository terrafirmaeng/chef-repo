# See http://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
ssl_verify_mode :verify_peer
log_level                :info
log_location             STDOUT
node_name                "lane_maxwell"
client_key               "#{current_dir}/lane_maxwell.pem"
validation_client_name   "terrafirmaeng-validator"
validation_key           "#{current_dir}/terrafirmaeng-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/terrafirmaeng"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
verify_api_cert true
