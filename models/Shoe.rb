require 'dm-core'
require 'dm-migrations'

class Shoe
  include DataMapper::Resource

  property :id, Serial
  property :modelo, String
end

