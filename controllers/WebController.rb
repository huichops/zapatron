require './controllers/AppController'

class WebController < AppController
  get '/' do
    erb :clientes
  end
end
