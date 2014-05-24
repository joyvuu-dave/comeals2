# == Schema Information
#
# Table name: attendances
#
#  id          :integer          not null, primary key
#  resident_id :integer
#  meal_id     :integer
#  multiplier  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Attendance do
  it 'can create an attendance' do
    attendance = create(:attendance)
    expect(attendance).to be_valid
  end
end
