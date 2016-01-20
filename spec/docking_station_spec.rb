require 'docking_station'

describe DockingStation do

  it {is_expected.to respond_to('release_bike')}

    describe '#release_bike' do
      it 'releases a bike' do
        bike = Bike.new
        subject.dock_bike(bike)
        expect(subject.release_bike).to eq bike
      end
    end

  describe Bike do
    it {is_expected.to respond_to :working?}
  end


  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it { is_expected.to respond_to(:bikes)}


  it 'error since no bikes available' do

    expect {subject.release_bike}.to raise_error("No bikes available")
  end


    describe '#dock_bike' do
      it 'docks something' do
        bike = Bike.new
        expect(subject.dock_bike(bike)).to eq bike
      end

      it 'error when one bike in docking_station' do
        subject.dock_bike(Bike.new)
        expect {subject.dock_bike(Bike.new)}.to raise_error("Bike already docked here")
      end
    end

end
