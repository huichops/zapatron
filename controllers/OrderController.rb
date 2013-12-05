requiere './controllers/AppController'

class OrderController <AppController
    get '/' do
        @orders = Order.all :order=> :id:desc
        @title = 'Pedido'
        erb :orders
    end

    post '/' do
    end
end|
