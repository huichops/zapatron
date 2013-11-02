require './controllers/AppController'

class ClientController < AppController
  get '/' do
    p "Index"
  end
end

