require 'sinatra/base'

class AppController < Sinatra::Base
  enable :sessions, :method_override


  run! if app_file == $0
end

