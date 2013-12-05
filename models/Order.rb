require 'dm-core'
require 'dm-migrations'

class Order
    include DataMapper::Resource
    property :id, Serial
    property :nombre, String
    DataMapper.finalize
end
