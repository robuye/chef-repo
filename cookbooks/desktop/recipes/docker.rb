docker_service "default" do
  action [:create, :start]
  userns_remap "default"
end

group "docker" do
  action :manage
  members [node["system"]["user"]]
  append true
end

file "/etc/subuid" do
  mode "0644"
  content <<-EOS
rob:100000:65536
dockremap:1000:1
dockremap:500000:65536
  EOS
  notifies :restart, "docker_service[default]", :delayed
end

file "/etc/subgid" do
  mode "0644"
  content <<-EOS
rob:100000:65536
dockremap:1000:1
dockremap:500000:65536
  EOS
  notifies :restart, "docker_service[default]", :delayed
end
