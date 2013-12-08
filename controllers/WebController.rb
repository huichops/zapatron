require './controllers/AppController'

class WebController < AppController
  get '/' do
    @orders = Order.all :order => :id.desc
    erb :test
  end

  get '/:id' do
    @orders = Order.all :order => :id.desc
    @order = Order.get params[:id]
    @shoes = Shoe.all :order => :id.desc
    @colors = Color.all :order => :id.desc
    erb :test
  end
end

