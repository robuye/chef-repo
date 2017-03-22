
package "python-pip"

bash "install aws-cli" do
  code "pip install --upgrade awscli"
end

node.rbenv.rubies.each do |v|
  rbenv_gem "aws-sdk" do
    action :upgrade
    rbenv_version v
  end

  rbenv_gem "aws-mfa" do
    action :upgrade
    rbenv_version v
  end
end
