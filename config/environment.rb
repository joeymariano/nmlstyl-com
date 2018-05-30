require 'bundler/setup'
Bundler.require(:default)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "db55jo8q2ghar9"
  :host     => "ec2-54-235-132-202.compute-1.amazonaws.com",
  :username => "pzfuofzpyffizq",
  :password => "21f32ff82a70f5b2d1f43e3f26ed0edfd6e8c8e27a8ef131b09ebfed5dbd4ee6"
)

require_all 'app'
