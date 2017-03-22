node.rbenv.rubies.each do |v|
  rbenv_gem "bundler" do
    action :upgrade
    rbenv_version v
  end

  rbenv_gem "nokogiri" do
    action :upgrade
    rbenv_version v
  end

  rbenv_gem "tmuxinator" do
    action :upgrade
    rbenv_version v
  end
end
