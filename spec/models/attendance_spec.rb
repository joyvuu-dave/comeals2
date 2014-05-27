# == Schema Information
#
# Table name: attendances
#
#  id            :integer          not null, primary key
#  attendee_id   :integer          not null
#  meal_id       :integer          not null
#  multiplier    :integer          default(2), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  attendee_type :string(255)      default("Resident"), not null
#
# Indexes
#
#  index_attendances_on_attendee_id_and_attendee_type              (attendee_id,attendee_type)
#  index_attendances_on_attendee_id_and_meal_id_and_attendee_type  (attendee_id,meal_id,attendee_type) UNIQUE
#

require 'spec_helper'

describe Attendance do
  it 'can create an attendance' do
    attendance = create(:attendance)
    expect(attendance).to be_valid
  end
end
