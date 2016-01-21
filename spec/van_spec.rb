require 'van'


describe Van do

  it {is_expected.to respond_to(:pick_up).with(1).argument}

  # describe '#pick_up' do
  #
  #   let(:bike){double("bike", :broken? => true)}
  #   let(:station){double("station", :dock_bike => :bike)}
  #   it 'is expected to pick up bikes from a station' do
  #     station.dock_bike(bike)
  #     subject.pick_up(station.broken_bikes)
  #     expect(subject.inspect).to include(bike)
  #   end
  #
  # end

end
