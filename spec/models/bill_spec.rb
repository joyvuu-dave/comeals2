# == Schema Information
#
# Table name: bills
#
#  id          :integer          not null, primary key
#  meal_id     :integer
#  resident_id :integer
#  cost        :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Bill do
  it 'can create a bill' do
    bill = create(:bill)
    expect(bill).to be_valid
  end
end
