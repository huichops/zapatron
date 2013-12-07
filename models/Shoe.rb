require 'dm-core'
require 'dm-migrations'

class Shoe
  include DataMapper::Resource

  #has n, :colors

  #belongs_to :batch

  property :id, Serial
  property :modelo, String
  DataMapper.finalize
end
