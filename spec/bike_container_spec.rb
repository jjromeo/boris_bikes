require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

	let(:bike) { double "bike", class: Bike}
	let(:holder) { ContainerHolder.new }
	let(:van) {double "van"}

	it "should accept a bike" do 
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it "should know when it's full" do
		expect(holder).not_to be_full
		fill_holder holder
		expect(holder).to be_full
	end


	it "should release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end


	it "should provide the list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end


	def fill_holder(holder)
		holder.capacity.times { holder.dock(Bike.new) }
	end


	it "should only allow bikes to dock" do
		expect(-> {holder.dock(van) }).to raise_error(RuntimeError)
	end

	it "should warn the user if an argument is not passed to 'dock'" do 
		expect( -> {holder.dock}).to raise_error "Please select a bike to dock"
	end

	it "should not release a bike when it's empty" do
		if holder.bike_count == 0
			expect(lambda {holder.release(bike) }).to raise_error(RuntimeError)
		end	
	end

	it "should warn the user if an argument is not passed to 'release'" do 
		expect(-> {holder.release}).to raise_error "Please select a bike to release"
	end





end
