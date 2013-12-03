require 'dm-core'
require 'dm-migrations'

class Client
  include DataMapper::Resource
  property :id, Serial
  property :nombre, String
  property :apellido, String
  property :telefono, String
  DataMapper.finalize
end


