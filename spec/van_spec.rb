require 'van'

describe Van do

	let(:van) {Van.new(:capacity => 20)}
	let(:bike) {double :bike, broken?: false}
	let(:broken_bike) {double :bike, broken?: true}
	let(:station) {double :station, release: broken_bike, dock: bike, broken_bikes: [broken_bike]}
	let(:garage) {double :garage, release: bike, bikes: [bike]}


	it "should allow default capacity setting on initialising" do
		expect(van.capacity).to eq(20)
	end

	it "should be able to collect broken bikes" do 
		expect(van.broken_bike_count).to eq 0
		van.collect_broken_bikes_from(station)
		expect(van.broken_bike_count).to eq 1
	end

	it "should be able to drop off bikes at the garage" do 
		van.collect_broken_bikes_from(station)
		van.deliver_bikes_to(garage)
		expect(van.broken_bike_count).to eq 0
	end

	it "should be able to pick up bikes from the garage" do 
		expect(van.bike_count).to eq 0
		van.pick_up_bikes_from(garage)
		expect(van.bike_count).to eq 1
	end


end