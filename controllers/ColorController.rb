require './controllers/AppController'

class ColorController < AppController
  get '/' do
    @colors = Color.all :order => :id.desc
    erb :clients
  end

  post '/' do
    c = Color.new
    c.nombre = params[:nombre]
    c.save
	redirect '/colors'
  end
end

