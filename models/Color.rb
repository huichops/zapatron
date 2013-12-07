require 'dm-core'
require 'dm-migrations'

class Color
  include DataMapper::Resource
  
  def self.up
 belongs_to :shoe
   end

  property :id, Serial
  property :nombre, String
  
 DataMapper.finalize
end

