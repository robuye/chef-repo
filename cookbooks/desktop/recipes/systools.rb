package "vim-gnome"
package "htop"
package "curl"
package "cryptsetup"
package "tmux"
package "byobu"
package "mailutils"
package "maildir-utils"

apt_repository "google-chrome" do
  uri "http://dl.google.com/linux/chrome/deb/"
  distribution "stable"
  components ["main"]
  key "https://dl.google.com/linux/linux_signing_key.pub"
  action :add
end

package "google-chrome-stable"
package "liblua5.2-dev"
package "lua5.2"
package "libjson-pp-perl"

# Vagrant
remote_file "#{Chef::Config[:file_cache_path]}/vagrant.deb" do
  source "https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_x86_64.deb"
  notifies :install, "dpkg_package[vagrant]", :immediately
  not_if "dpkg -s vagrant" # package is already installed
end

dpkg_package 'vagrant' do
  source "#{Chef::Config[:file_cache_path]}/vagrant.deb"
  action :nothing
end

package "virtualbox"
