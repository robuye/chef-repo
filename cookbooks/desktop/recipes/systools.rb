package "vim-gnome"
package "htop"
package "curl"
package "cryptsetup"
package "tmux"

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
