# frozen_string_literal: true

require 'app_store_connect/jwt/version'

HOSTS_BY_KEY = {
  rubygems: 'https://rubygems.org',
  github: 'https://rubygems.pkg.github.com/kyledecot'
}.freeze

desc "Push app_store_connect_jwt-#{AppStoreConnect::JWT::VERSION}.gem"
task :push, [:key] do |_task, args|
  args.with_defaults(key: 'rubygems')

  sh(
    'gem push',
    "--key=#{args.key}",
    "--host=#{HOSTS_BY_KEY.fetch(args.key.to_sym)}",
    "app_store_connect_jwt-#{AppStoreConnect::JWT::VERSION}.gem"
  )
end
