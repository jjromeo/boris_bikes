module BikeContainer
		DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count()
		bikes.count
	end

	def dock(bike = nil)
		raise "Holder is full" if full?
		raise "Please select a bike to dock" if bike == nil
		raise "Only bikes can be docked" if bike.class != Bike
		bikes << bike
	end

	def release(bike = nil)
		raise "Please select a bike to release" if bike == nil
		raise "No bikes available" if bike_count == 0
		bikes.delete(bike)
	end

	def full?
		bike_count == capacity
	end

	def empty?
		bike_count == 0
	end

	def available_bikes
		bikes.reject {|bike| bike.broken? }
	end



end