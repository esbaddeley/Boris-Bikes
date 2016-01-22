require "bike"

describe Bike do
	it { is_expected.to respond_to :broken}

	it 'reports that a bike is broken' do
		bike = double(:bike)
		allow(bike).to receive(:report_broken).and_return(true)
		expect(bike.report_broken).to eq true
	end
end
