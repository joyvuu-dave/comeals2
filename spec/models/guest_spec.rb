# == Schema Information
#
# Table name: guests
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  multiplier  :integer          default(2), not null
#  meal_id     :integer          not null
#  resident_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_guests_on_meal_id      (meal_id)
#  index_guests_on_resident_id  (resident_id)
#

require 'rails_helper'

describe Guest do
  it 'can create a guest' do
    guest = create(:guest)
    expect(guest).to be_valid
  end
end
