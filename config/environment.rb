require 'bundler/setup'
Bundler.require(:default)

dbconfig = YAML::load(File.open('config/database.yml'))[env]
ActiveRecord::Base.establish_connection(dbconfig)

require_all 'app'
