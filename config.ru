require 'sinatra/base'
require './controllers/WebController'
require './controllers/ClientController'

#Dir['./controllers/*.rb'].each do
#    |file| require file 
#    p file
#end

map('/') { run WebController }
map('/clientes') { run ClientController }

