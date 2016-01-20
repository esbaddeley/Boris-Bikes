require 'DockingStation.rb'

describe DockingStation do
it {is_expected.to respond_to :release_bike}

it { is_expected.to respond_to(:dock).with(1).argument }

it 'docks something' do
	bike = Bike.new
	expect(subject.dock(bike)).to eq bike
end

it 'raises an error when the docking station is full' do
	bike = Bike.new
	subject.dock(bike)
	expect { subject.dock(bike) }.to raise_error 'Docking station full'
end

describe '#release_bike' do
it 'raises an error when there are no bikes available' do
	expect{ subject.release_bike }.to raise_error 'No bikes available'
end
end

end
