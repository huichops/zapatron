require './controllers/AppController'

class OrderController <AppController
    get '/' do
        @orders = Order.all :order=> :id.desc
        @title = 'Pedido'
        erb :OrderIndex
    end

    post '/' do
        o =Order.new
        o.nombre = params[:id]
        erb :OrderEdit
    end

    put '/:id'do
        o = Order.get param[:id]
        o.nombre = params[:nombre]
        o.save
        redirect '/orders'
    end
    get '/id/delete' do
        @order = order.get params[id]
        erb :OrderDelete
    end

    delete '/:id' do
        o = order.get params[:id]
        o.destroy
        redirect '/orders'
    end
end

