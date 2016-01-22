require "van"

describe Van do
  #let(:station){double("station", :release_broken_bikes => [])}
  let(:bike){double("bike", :broken => true)}

  it { is_expected.to respond_to :dock}

  it 'docks broken bikes' do
  expect(subject.dock(bike)).to include(bike)
  end

  it { is_expected.to respond_to :release_broken_bikes}

  it 'releases broken bikes' do
  subject.dock(bike)
  expect(subject.release_broken_bikes).to include(bike)
  end

  # it 'releases broken bikes' do
  # expect(subject.release_broken)



end
