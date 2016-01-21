require 'docking_station'

describe DockingStation do

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it {is_expected.to respond_to('release_bike')}

    describe '#release_bike' do
      let (:bike){Bike.new}
      it 'releases a bike' do
        subject.dock_bike(bike)
        expect(subject.release_bike).to eq bike
      end
      it 'should be working' do
        expect(bike).to be_working
      end

      let (:bike2){Bike.new}
      it 'does not release a broken bike' do
          bike.report_broken
          subject.dock_bike(bike2)
          subject.dock_bike(bike)
          expect(subject.release_bike).not_to be_broken
      end
    end

  describe Bike do
    let (:bike){Bike.new}
    it {is_expected.to respond_to :working?}

   # it 'expecting bike to break' {is_expect.to respond_to(dock_bike(bike, false))}
  end


  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it { is_expected.to respond_to(:bikes)}


  it 'error since no bikes available' do
    expect {subject.release_bike}.to raise_error("No working bikes available")
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

      let (:bike){Bike.new}
      it 'docks a broken bike' do
          bike.report_broken
          subject.dock_bike(bike)
          expect(subject.broken_bikes).to include(bike)
      end



    end


    describe 'initialization' do
      subject { DockingStation.new }
      let(:bike) { Bike.new }
      it 'defaults capacity' do
        described_class::DEFAULT_CAPACITY.times do
          subject.dock_bike(bike)
        end
        expect{ subject.dock_bike(bike) }.to raise_error 'No space!'
      end


      it 'initializing with capacity of 49' do
        station = DockingStation.new 49
        station.capacity.times{station.dock_bike(bike)}
        expect {station.dock_bike(bike)}.to raise_error 'No space!'
      end




    end

end
