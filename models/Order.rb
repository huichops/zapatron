require 'dm-core'
require 'dm-migrations'
require 'date'

class Order
    include DataMapper::Resource
    property :id, Serial
    property :nombre, String
    property :fecha, Date
    DataMapper.finalize
end
