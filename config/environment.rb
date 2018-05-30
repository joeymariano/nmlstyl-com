require 'bundler/setup'
Bundler.require(:default)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "db55jo8q2ghar9"
)

require_all 'app'
