require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		@capacity = options[:capacity]
	end


	def collect_broken_bikes_from(station)
		station.broken_bikes.each do |bike|
		 bikes << bike
		 station.release(bike)
		end
	end

	def deliver_bikes_to(garage)
		broken_bikes.each do |bike|
		garage.dock bike
		release(bike)
		end
	end

	def pick_up_bikes_from(garage)
		garage.bikes.each do |bike|
		@bikes << bike 
		garage.release(bike)
		end
	end


end
