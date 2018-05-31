require 'bundler/setup'
Bundler.require(:default)

dbconfig = YAML::load(File.open('config/database.yml'))

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => dbconfig
)

require_all 'app'
