require './controllers/AppController'

class OrderController < AppController
  get '/' do
    # @orders = Order.all :order=> :id.desc
    # @title = 'Pedido'
    # erb :OrderIndex
    redirect '/'
  end

  post '/' do
    o = Order.new
    o.fechaEntrega = Time.parse params[:fechaEntrega]
    o.fecha = Time.now
    if o.save
      @out = 'Guardado con exito'
    else
      @out = 'Error al guardar'
    end
    redirect '/orders'
  end

  post '/index' do
    o = Order.new
    p params[:fechaEntrega]
    o.fechaEntrega = Date.strptime(params[:fechaEntrega], '%Y-%d-%m')
    o.fecha = Time.now
    if o.save
      @out = 'Guardado con exito'
    else
      @out = 'Error al guardar'
    end
    redirect '/'
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
    o.fechaEntrega = Date.strptime(params[:fechaEntrega], '%Y-%d-%m')
    if o.save
      @out = 'Guardado con exito'
    else
      @out = 'Error al guardar'
    end
    redirect '/orders'
  end

  get '/:id/delete' do
    @order = Order.get params[:id]
    erb :OrderDelete
  end

  delete '/:id' do
    o = Order.get params[:id]
    b = Batch.all(:order_id => o.id)
    if b
      b.each do |bb|
        bb.destroy
      end
    end

    o.destroy
    redirect '/orders'
  end
end

