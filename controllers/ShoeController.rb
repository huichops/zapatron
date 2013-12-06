require './controllers/AppController'

class ShoeController < AppController
  get '/' do
    @shoes = Shoe.all :order => :id.desc
    @title = 'Zapatos'
    erb :clients
  end

  post '/' do
    s = Shoe.new
    s.model = params[:model]
    s.save
	redirect '/shoes'
  end
end

get '/:id' do
    @shoes = Shoe.get params[:id]
    @title = 'Editar Modelo'
    erb :ShoeEdit
  end

  put '/:id' do
    s = Shoe.get params[:id]
    s.nombre = params[:nombre]
    s.save
    redirect '/shoes'
  end

  get '/:id/delete' do
    @shoes = Shoe.get params[:id]
    @title = 'Eliminar modelo'
    erb :ShoeDelete
  end

  delete '/:id' do
    s = Color.get params[:id]
    s.destroy
    redirect '/shoes'
  end
end
