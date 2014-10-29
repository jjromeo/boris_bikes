require_relative 'bike_container'

class Garage; include BikeContainer


	def initialize(options = {})
		@capacity = options[:capacity]
	end

	def dock(bike = nil)
		bike.fix!
		super
	end



end
