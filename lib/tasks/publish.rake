# frozen_string_literal: true

require 'app_store_connect/jwt/version'

HOSTS_BY_KEY = {
  rubygems: 'https://rubygems.org',
  github: 'https://rubygems.pkg.github.com/kyledecot'
}.freeze

task :publish, [:key] do |task, args|
  system "gem push --key=#{args.key} --host=#{HOSTS_BY_KEY.fetch(args.key.to_sym)} app_store_connect_jwt-#{AppStoreConnect::JWT::VERSION}.gem"
end 
