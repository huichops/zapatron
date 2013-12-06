require './controllers/AppController'

class ShoeController < AppController
  get '/' do
    @shoes = Shoe.all :order => :id.desc
    @title = 'Zapatos'
    erb :clients
  end

  post '/' do
    s = Shoe.new
    c.model = params[:model]
    c.save
	redirect '/shoes'
  end
end