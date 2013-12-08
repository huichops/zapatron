require './controllers/AppController'
require 'json'

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

  get '/:id' do
    @order = Order.get params[:id]
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

