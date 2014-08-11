# link to the Bike class
require 'bike'

# we're describing the functionality of a specific class, Bike
describe Bike do 
	# this is a specific feature (behaviour)
	# that we expect to be present
	it "should not be broken after we create it" do 
		the_bike = Bike.new # initialise a new object of Bike class
		# expect an instance of this class to have 
		# a method "broken?" that should return false"
		expect(the_bike).not_to be_broken
	end
end