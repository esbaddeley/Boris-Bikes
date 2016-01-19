require 'DockingStation.rb'

describe DockingStation do
it {is_expected.to respond_to :release_bike}

it { is_expected.to respond_to(:dock).with(1).argument }

it 'docks something' do
	bike = Bike.new
	expect(subject.dock(bike)).to eq bike
end

describe '#release_bike' do
it 'raises an error when there are no bikes available' do
	expect{ subject.release_bike }.to raise_error 'No bikes available'
end
end

end
