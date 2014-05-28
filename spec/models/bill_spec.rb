# == Schema Information
#
# Table name: bills
#
#  id             :integer          not null, primary key
#  meal_id        :integer          not null
#  resident_id    :integer          not null
#  amount         :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  amount_decimal :decimal(12, 2)   default(0.0), not null
#
# Indexes
#
#  index_bills_on_meal_id      (meal_id)
#  index_bills_on_resident_id  (resident_id)
#

require 'spec_helper'

describe Bill do
  it 'can create a bill' do
    bill = create(:bill)
    expect(bill).to be_valid
  end
end
