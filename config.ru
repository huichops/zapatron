require 'sinatra/base'
require './models/Client'
require './controllers/WebController'
require './controllers/ClientController'

#Dir['./controllers/*.rb'].each do
#    |file| require file 
#    p file
#end

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/development.db")

map('/') { run WebController }
map('/clientes') { run ClientController }

