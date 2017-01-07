# == Schema Information
#
# Table name: push_conditions
#
#  id                  :integer          not null, primary key
#  skin_type           :string(255)
#  hair_type           :string(255)
#  minimum_temperature :integer
#  maximum_temperature :integer
#  minimum_humidity    :integer
#  maximum_humidity    :integer
#  time_of_a_day       :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  amazon_tags         :string(255)
#  type                :string(255)
#

require 'spec_helper'

describe PushCondition do
  describe '#unique_message' do
    before do
      @user = FactoryGirl.create(:user)
      @push_condition = SkinCondition.create({ skin_type: 'normal', time_of_a_day: '9am', minimum_temperature: 60, maximum_temperature: 80,
                                              minimum_humidity: 60, maximum_humidity: 70 })
      @push_condition.push_texts.create([{ text: 'first note' }, { text: 'second note' }])
    end

    it do
      expect(@push_condition.send(:unique_message, @user)).to eq('first note')
      expect(@push_condition.send(:unique_message, @user)).to eq('second note')
      expect(@push_condition.send(:unique_message, @user)).to eq(nil)
    end
  end
end
