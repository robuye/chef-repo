directory node["nvm"]["directory"] do
  action :create
  owner  node["system"]["user"]
  group  node["system"]["user"]
  mode   '0755'
end

bash "install NVM" do
  cwd node["nvm"]["directory"]
  code <<-EOS
    git clone https://github.com/creationix/nvm.git "#{node["nvm"]["directory"]}"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
    . nvm.sh
  EOS
  not_if { ::File.exists?("/etc/profile.d/nvm.sh") }
end

file "/etc/profile.d/nvm.sh" do
  action :create
  mode '0755'
  content <<-EOS
    export NVM_DIR="#{node["nvm"]["directory"]}"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  EOS
end

node["nvm"]["versions"].each do |version|
  bash "install nodejs #{version}" do
    user node["system"]["user"]
    code <<-EOS
      source /etc/profile.d/nvm.sh

      nvm install #{version}
    EOS
  end
end

file "/home/#{node["system"]["user"]}/.nvmrc" do
  mode 755
  action :create
  owner node["system"]["user"]
  group node["system"]["user"]
  content node["nvm"]["global"]
end
