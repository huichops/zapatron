require 'sinatra/base'

Dir['./controllers/*.rb'].each { |file| require file }

map('/') { run WebController }
map('/clientes') { run ClientController }

