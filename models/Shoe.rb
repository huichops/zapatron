require 'dm-core'
require 'dm-migrations'

class Shoe
  include DataMapper::Resource
  property :id, Serial
  property :model, String
  DataMapper.finalize
end
