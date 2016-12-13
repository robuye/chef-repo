common_deps = %w(git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev)

common_deps.each do |name|
  package name do
    action :install
  end
end

gem_package "rails"

gem_package "pg"
gem_package "mysql2"
