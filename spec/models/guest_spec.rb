# == Schema Information
#
# Table name: guests
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  multiplier  :integer          default(2), not null
#  meal_id     :integer          not null
#  resident_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

describe Guest do
  it 'can create a guest' do
    guest = create(:guest)
    expect(guest).to be_valid
  end
end
