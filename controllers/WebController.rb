require './controllers/AppController'

class WebController < AppController
  get '/' do
    erb :test
  end
end
