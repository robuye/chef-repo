gem_package "aws-sdk" do
  action :upgrade
end

package "python-pip"

bash "install aws-cli" do
  code "pip install --upgrade awscli"
end

gem_package "aws-mfa" do
  action :upgrade
end

