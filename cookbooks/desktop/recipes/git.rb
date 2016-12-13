include_recipe 'git::default'

bash 'configure git' do
  code <<-EOS
    git config --global user.name "#{node['git']['user']['name']}"
    git config --global user.email "#{node['git']['user']['email']}"
    git config --global core.editor "#{node['git']['core']['editor']}"
  EOS
end
