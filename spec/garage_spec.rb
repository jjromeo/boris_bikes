require 'garage' 

describe Garage do 

let(:garage) {Garage.new(capacity: 100)}
let(:van) {double :van, broken_bikes: broken_bike }
let(:broken_bike) {double :broken_bike, broken?: true, class: Bike, fix!: false}


	it "should allow default capacity setting on initialising" do
		expect(garage.capacity).to eq(100)
	end

	it "should fix a broken bike which enters it" do
		garage.dock(broken_bike)
		expect(broken_bike).not_to be_broken
	end
end