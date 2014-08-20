require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		# self.capacity is calling the capacity=() method
		# (note the equals sign) designed in BikeContainer
		# capacity (the second argument to fetch()) is calling
		# the capacity() method in BikeContainer
		self.capacity = options.fetch(:capacity, capacity)
	end


	def collect_broken_bikes_from(station)
		station.broken_bikes.each do |bike|
		 bikes << bike
		 station.release(bike)
		end
	end

	def deliver_bikes_to(garage)
		broken_bikes.each do |bike|
		bikes << bike
		release(bike)
		end
	end


end