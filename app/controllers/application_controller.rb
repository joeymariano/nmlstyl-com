require 'net/http'
require 'json'
require 'sinatra/flash'
require 'pry'

class ApplicationController < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :public_folder, 'public'
  set :views, 'app/views'


  before do  # necessary for Heroku to load ENV values
    if Sinatra::Base.environment == :development
      require 'dotenv/load'
    end
  end

  get '/pastshows' do
    url = 'https://api.songkick.com/api/3.0/artists/8980439/gigography.json?apikey=' + ENV['SONGKICK_API_KEY']
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)
    binding.pry
    nmlstyl_events = result['resultsPage']['results']['event']

    url2 = 'https://api.songkick.com/api/3.0/artists/605451/gigography.json?apikey=' + ENV['SONGKICK_API_KEY']
    uri2 = URI(url2)
    response2 = Net::HTTP.get(uri2)
    result2 = JSON.parse(response2)
    animalstyle_events = result['resultsPage']['results']['event']

    binding.pry

    @events = nmlstyl_events + animalstyle_events
    @events.uniq!
    @events.reverse

    erb :'pastshows'
  end

  get '/' do
    url = 'https://api.songkick.com/api/3.0/artists/8980439/calendar.json?apikey=' + ENV['SONGKICK_API_KEY']
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)
    @events = result['resultsPage']['results']['event']
    erb :'index'
  end

  post '/email' do
    email = Email.new(email: params['email'])
    if email.save
      flash[:notice] = "thanks for signing up ;)"
      redirect to "/"
    else
      flash[:notice] = "hmm... try again maybe."
      redirect to "/"
    end
  end
end
