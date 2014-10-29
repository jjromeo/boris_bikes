# load BikeContainer
require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def initialize(options = {})
		@capacity = options[:capacity]
	end

end
