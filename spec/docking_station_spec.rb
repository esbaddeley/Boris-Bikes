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
  it 'bike works' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.release_bike.working?).to eq true
  end

  #it do expect(subject.release_bike.working?).to eq true
  #end

  #it {is_expected.to respond_to('dock_bike').with(1).argument}

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it { is_expected.to respond_to(:bike)}

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock_bike(bike)).to eq bike
  end



  it 'error since no bikes available' do

    expect {subject.release_bike}.to raise_error("No bikes available")
  end

end
