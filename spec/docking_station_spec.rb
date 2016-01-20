require 'docking_station'

describe DockingStation do

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

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
        expect(subject.dock_bike(bike)).to eq [bike]
      end

      it 'error when full due to capacity' do
        subject.capacity.times{subject.dock_bike(Bike.new)}
        expect {subject.dock_bike(Bike.new)}.to raise_error("No space!")
      end
=begin
#solution version of initialization unit test
    describe 'initialization' do
      subject { DockingStation.new }
      let(:bike) { Bike.new }
      it 'defaults capacity' do
        described_class::DEFAULT_CAPACITY.times do
          subject.dock(bike)
        end
        expect{ subject.dock(bike) }.to raise_error 'Docking station full'
      end
=end

    end

end
