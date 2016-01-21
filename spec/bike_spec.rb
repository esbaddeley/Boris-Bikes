require 'bike'

describe Bike do

  it {is_expected.to respond_to('working?')}

  it{is_expected.to respond_to(:report_bike)}

  it do
  	expect(subject).to be_broken
  #Check this syntax...
end

  

# is expecting subject.working? to retrun true
  #it do
    #expect (subject.working?).to eq('true')
  #end
end
