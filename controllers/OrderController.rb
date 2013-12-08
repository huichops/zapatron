require './controllers/AppController'

class OrderController < AppController
  get '/' do
    @orders = Order.all :order=> :id.desc
    @title = 'Pedido'
    erb :OrderIndex
  end

  post '/' do
    o = Order.new
    o.nombre = params[:nombre]
    o.fecha = Time.now
    o.fechaEntrega = Time.now
    o.save
    redirect '/orders'
  end

  get '/add' do
    @shoes = Shoe.all :order => :id.desc
    @colors = Color.all :order => :id.desc
    erb :OrderAdd
  end

  get '/:id' do
    @order = Order.get params[:id]
    @shoes = Shoe.all :order => :id.desc
    @colors = Color.all :order => :id.desc
    erb :OrderEdit
  end

  put '/:id'do
    o = Order.get params[:id]
    o.nombre = params[:nombre]
    o.fecha = Time.now
    o.fechaEntrega = Time.now
    o.save
    redirect '/orders'
  end

  get '/:id/delete' do
    @order = Order.get params[:id]
    erb :OrderDelete
  end

  delete '/:id' do
    o = Order.get params[:id]
    o.destroy
    redirect '/orders'
  end
end

