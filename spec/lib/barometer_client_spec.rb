require 'spec_helper'

describe BarometerClient, vcr: true do
  describe '#get_weather' do
    let!(:user) { FactoryGirl.create(:user) }

    subject { BarometerClient.get_weather(latitude: user.latitude, longitude: user.longitude) }
    let(:expectation) { BarometerClient::CurrentWeather.new('20', 70.0) }

    it { expect(subject.temperature).to eql(expectation.temperature) }
    it { expect(subject.temperature).to eql(68) }
    it { expect(subject.humidity).to eql(expectation.humidity) }
    it { expect(subject.humidity).to eql(70) }
  end
end
