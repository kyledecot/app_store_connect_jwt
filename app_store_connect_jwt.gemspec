# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'app_store_connect/jwt/version'

Gem::Specification.new do |spec|
  spec.name          = 'app_store_connect_jwt'
  spec.version       = AppStoreConnect::JWT::VERSION
  spec.authors       = ['Kyle Decot']
  spec.email         = ['kyle.decot@icloud.com']

  spec.summary       = 'Generate App Store Connect JWT'
  spec.description   = 'Generate App Store Connect JWT'
  spec.homepage      = 'https://github.com/kyledecot/app_store_connect_jwt'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency 'pry', '~> 0.12'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.79'
  spec.add_development_dependency 'simplecov', '~> 0.17'
  spec.add_development_dependency 'timecop', '~> 0.9'

  spec.add_runtime_dependency 'gli', '~> 2.19'
  spec.add_runtime_dependency 'jwt', '~> 2.2'
end
