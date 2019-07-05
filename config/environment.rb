require 'bundler/setup'
Bundler.require(:default)

configure :development  do
db  =  URI.parse('postgres://localhost/nmlstyl_emails')
  ActiveRecord::Base.establish_connection(
    :adapter  =>  db.scheme  ==  'postgres'  ?  'postgresql' : db.scheme,
    :host  =>  db.host,
    :username  =>  db.user,
    :password  =>  db.password,
    :database  =>  db.path[1..-1],
    :encoding  =>  'utf8'
    )
end

configure :production  do
db  =  URI.parse(ENV['DATABASE_URL'])
  ActiveRecord::Base.establish_connection(
    :adapter  =>  db.scheme  ==  'postgres'  ?  'postgresql' : db.scheme,
    :host  =>  db.host,
    :username  =>  db.user,
    :password  =>  db.password,
    :database  =>  db.path[1..-1],
    :encoding  =>  'utf8'
    )
end

require_all 'app'
