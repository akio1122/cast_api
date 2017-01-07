require 'spec_helper'
require 'rake'
CastApi::Application.load_tasks

describe :check_conditions do
  before {
    Delayed::Worker.delay_jobs = false
    allow(CheckConditions).to receive(:call)
  }
  let!(:users) { FactoryGirl.create_list(:user, 3) }

  it do
    User.find_each do |user|
      expect(CheckConditions).to receive(:call).with(user: user, time_of_a_day: '9am', type: :skin).once
      expect(CheckConditions).to receive(:call).with(user: user, time_of_a_day: '9am', type: :hair).once
      expect(CheckConditions).to receive(:call).with(user: user, time_of_a_day: '12pm', type: :skin).once
      expect(CheckConditions).to receive(:call).with(user: user, time_of_a_day: '12pm', type: :hair).once
    end
    Rake::Task['check_conditions'].invoke
  end
end
