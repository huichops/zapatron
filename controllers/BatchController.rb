require './controllers/AppController'

class BatchController < AppController

  get '/' do
    @batches = Batch.all :order => :id.desc
# query zapatos y de colores y pedidos
    @shoes = Shoe.all :order => :id.desc
    @colors = Color.all :order => :id.desc
#    @orders = Order.all :order => :id.desc	
    @title = 'Lotes'
    erb :BatchesIndex
  end

  post '/' do
    b = Batch.new
    b.shoeModel = params[:shoe]
    b.numeration = params[:numeration]
    b.color = params[:color]
    b.shoePairs = params[:shoePairs]
    b.save
    redirect '/batches'
  end

  get '/:id' do
    @batch = Batch.get params[:id]
    erb :BatchEdit
  end

  put '/:id' do
    b = Batch.get params[:id]
    b.shoeModel = params[:shoeModel]
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
