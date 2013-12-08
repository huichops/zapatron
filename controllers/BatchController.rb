require './controllers/AppController'

class BatchController < AppController

  get '/' do
    @batches = Batch.all :order => :id.desc
    @shoes = Shoe.all :order => :id.desc
    @colors = Color.all :order => :id.desc
    @orders = Order.all :order => :id.desc
    @title = 'Lotes'
    erb :BatchesIndex
  end

  post '/' do
    b = Batch.new
    b.shoeModel = params[:shoe]
    b.numeration = params[:numeration]
    b.color = params[:color]
    b.shoePairs = params[:shoePairs]
    b.order_id = params[:order]
    b.save
    redirect '/batches'
  end

  post '/index' do
    b = Batch.new
    b.shoeModel = params[:shoe]
    b.numeration = params[:numeration]
    b.color = params[:color]
    b.shoePairs = params[:shoePairs]
    b.order_id = params[:order]
    b.save
    redirect "/#{params[:order]}"
  end

  post '/pedido' do
    b = Batch.new
    b.shoeModel = params[:shoe]
    b.numeration = params[:numeration]
    b.color = params[:color]
    b.shoePairs = params[:shoePairs]
    b.order_id = params[:order]
    b.save
    redirect "/orders/#{params[:order]}"
  end

  get '/:id' do
    @batch = Batch.get params[:id]
    @order = Order.get @batch.order_id
    erb :BatchEdit
  end

  put '/:id' do
    b = Batch.get params[:id]
    b.shoeModel = params[:shoe]
    b.numeration = params[:numeration]
    b.color = params[:color]
    b.shoePairs = params[:shoePairs]
    b.save
    redirect '/batches'
  end

  get '/:id/delete' do
    @batch = Batch.get params[:id]
    erb :BatchDelete
  end

  delete '/:id' do
    b = Batch.get params[:id]
    b.destroy
    redirect '/batches'
  end
end
