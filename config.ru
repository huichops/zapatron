require 'sinatra/base'

Dir['./models/*.rb'].each do |file| 
   require file 
end

Dir['./controllers/*.rb'].each do |file| 
   require file 
end

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/development.db")
DataMapper.auto_upgrade!

map('/') { run WebController }
map('/clientes') { run ClientController }
map('/colors') { run ColorController }
map('/shoes') { run ShoeController }
map('/orders') { run OrderController }
#map('/batches') { run BatchController }


