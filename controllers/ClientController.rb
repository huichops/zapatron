require './controllers/AppController'

class ClientController < AppController
  get '/' do
    @clients = Client.all :order => :id.desc
    @title = 'Clientes'
    erb :clients
  end

  post '/' do
    c = Client.new
    c.nombre = params[:nombre]
    c.apellido = params[:apellido]
    c.telefono = params[:telefono]
    c.save
  end
end

