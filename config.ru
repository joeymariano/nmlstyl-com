$:.unshift '.'
require 'config/environment'

# # use Rack::Static
# #
# # use Rack::MethodOverride
# run Sinatra::Application
run ApplicationController
