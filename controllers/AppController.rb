require 'sinatra/base'

class AppController < Sinatra::Base
  enable :sessions, :method_override

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  not_found{ p "Not fucking found" }

end

