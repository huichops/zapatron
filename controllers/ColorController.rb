require './controllers/AppController'

class ColorController < AppController
  get '/' do
    @colors = Color.all :order => :id.desc
    erb :ColorIndex
  end

  post '/' do
    c = Color.new
    c.nombre = params[:nombre]
    c.save
    redirect '/colors'
  end

  get '/:id' do
    @color = Color.get params[:id]
    erb :ColorEdit
  end

  put '/:id' do
    c = Color.get params[:id]
    c.nombre = params[:nombre]
    c.save
    redirect '/colors'
  end

  get '/:id/delete' do
    @color = Color.get params[:id]
    erb :ColorDelete
  end

  delete '/:id' do
    c = Color.get params[:id]
    c.destroy
    redirect '/colors'
  end
end

