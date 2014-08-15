require 'van'

describe Van do

	let(:van) {Van.new(:capacity => 123)}


it 'should allow default capacity setting on initialising' do
	expect(van.capacity).to eq(123)
	end










end