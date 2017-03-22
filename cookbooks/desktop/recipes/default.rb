include_recipe "apt::default"
include_recipe "build-essential::default"
include_recipe "#{cookbook_name}::systools"
include_recipe "#{cookbook_name}::git"

package "openjdk-8-jre" # for JRuby

include_recipe "ruby_build::default"
include_recipe "ruby_rbenv::system"
include_recipe "postgresql::client"
mysql_client "default"
include_recipe "#{cookbook_name}::nodejs"
include_recipe "#{cookbook_name}::std_gems"
include_recipe "#{cookbook_name}::rails"
include_recipe "#{cookbook_name}::aws"

include_recipe "redisio::default"
include_recipe "redisio::disable"
include_recipe "redisio::redis_gem"

rbenv_rehash "rehash"

include_recipe "#{cookbook_name}::openvpn"
include_recipe "#{cookbook_name}::docker"
include_recipe "#{cookbook_name}::other"
