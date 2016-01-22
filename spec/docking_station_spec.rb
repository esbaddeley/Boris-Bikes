require "docking_station"

describe DockingStation do

  describe "#release_bike" do

    let(:bike){ double :bike }


      it { is_expected.to respond_to :release_bike }

      it 'returns a Bike' do
        allow(bike).to receive(:broken).and_return(false)
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end

      it "doesn't release a bike if there are none available" do
        expect {subject.release_bike}.to raise_error("There are no bikes here!")
      end

      it "doesn't dock a bike if over capacity" do
         subject.set_capacity.times{subject.dock(bike)}
         expect{subject.dock(bike)}.to raise_error("No space to dock here.")
      end

    let(:bike){double("bike", :report_broken => true, :broken => true)}

      it 'does not release a broken bike' do
        bike.report_broken
        subject.dock(bike)
        expect {subject.release_bike}.to raise_error("There is no bike available")
      end
    end

  describe "#dock" do
    it {is_expected.to respond_to(:dock)}

    it 'docks a working bike' do
      test_bike = double(:bike)
      expect(subject.dock(test_bike).last).to eq test_bike
    end

    it 'docks a broken bike' do
      test_bike = double(:bike)
      allow(test_bike).to receive(:report_broken).and_return(true)
      test_bike.report_broken
      expect(subject.dock(test_bike).last).to eq test_bike
    end
  end

  it {is_expected.to respond_to :bikes}

  it 'returns docked bike' do
    test_bike = double(:bike)
    subject.dock(test_bike)
    expect(subject.bikes.last).to eq test_bike
  end

  describe "#capacity" do
    it 'sets a new capacity when provided a new value' do
    	expect(subject.set_capacity(30)).to eq 30
    end

    it 'checks if default capacity is 20' do
    	expect(subject.set_capacity).to eq 20
    end
  end

  describe "#release_broken_bikes" do

    it { is_expected.to respond_to :release_broken_bikes }

    it 'releases broken bikes' do
      test_bike = double(:bike)
      subject.dock(test_bike)
      allow(test_bike).to receive(:broken).and_return(true)
      expect(subject.release_broken_bikes.last).to eq test_bike
    end

  end

end
