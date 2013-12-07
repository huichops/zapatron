require 'dm-core'
require 'dm-migrations'

class Batch
	include DataMapper::Resource
	property :id, Serial
	property :numeration, String
	property :color, String
	property :shoeModel, String
	property :shoePairs, Integer
	# belongs_to :order
	#has n, :shoes, :through => Resource
end
