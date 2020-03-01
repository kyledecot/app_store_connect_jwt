# frozen_string_literal: true

require 'app_store_connect/jwt/version'

desc "Build app_store_connect_jwt-#{AppStoreConnect::JWT::VERSION}.gem"
task :build do
  sh %(gem build app_store_connect_jwt.gemspec)
end
