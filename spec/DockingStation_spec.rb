require 'DockingStation.rb'

describe DockingStation do
it {is_expected.to respond_to :release_bike}

it { is_expected.to respond_to(:dock).with(1).argument }

it 'docks something' do
	bike = Bike.new
	expect(subject.dock(bike)).to include(bike)
end

it 'raises an error when the docking station is full' do
	bike = Bike.new
	DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
	expect { subject.dock(bike) }.to raise_error 'Docking station full'
end

it 'allows a user to set a capacity variable when a Docking Station is instantiated' do
	station = DockingStation.new(35)
	expect (station.capacity) == 35
end

it 'assigns the default capacity to DEFAULT_CAPACITY when no arguments are passed' do
	station = DockingStation.new
	expect(station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
end

it 'allows a user to report a bike as broken' do
	station = DockingStation.new
	expect((station.dock(Bike.new, false).pop).bike_working).to eq false
end


describe '#release_bike' do
it 'raises an error when there are no bikes available' do
	expect{ subject.release_bike }.to raise_error 'No bikes available'
end

it 'does not release bikes which are broken' do
	station = DockingStation.new
	station.dock(Bike.new, true)
	station.dock(Bike.new, false)
	expect((station.release_bike).bike_working).to eq true
end





end

end
