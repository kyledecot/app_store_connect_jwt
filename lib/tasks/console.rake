require 'pry'
require 'app_store_connect/jwt'

desc 'Start a pry console'
task :console do 
  Pry.start(AppStoreConnect::JWT)
end 
