require './controllers/AppController'

class ShoeController < AppController
  get '/' do
    @shoes = Shoe.all :order => :id.desc
    @title = 'Zapatos'
    erb :ShoeIndex
  end

  post '/' do
    s = Shoe.new
    s.modelo = params[:modelo]
    s.save
	redirect '/shoes'
  end

  get '/:id' do
    @shoe = Shoe.get params[:id]
    @title = 'Editar Modelo'
    erb :ShoeEdit
  end

  put '/:id' do
    s = Shoe.get params[:id]
    s.modelo = params[:modelo]
    s.save
    redirect '/shoes'
  end

  get '/:id/delete' do
    @shoe = Shoe.get params[:id]
    @title = 'Eliminar modelo'
    erb :ShoeDelete
  end

  delete '/:id' do
    s = Shoe.get params[:id]
    s.destroy
    redirect '/shoes'
  end
end
