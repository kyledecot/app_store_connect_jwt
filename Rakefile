# frozen_string_literal: true

require 'pry'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task(:console) { sh 'bin/console' }
task default: :spec
