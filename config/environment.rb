require 'bundler/setup'
Bundler.require(:default)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "db/emails.postgresql"
)

require_all 'app'
