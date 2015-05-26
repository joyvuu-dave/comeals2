# == Schema Information
#
# Table name: meal_residents
#
#  id          :integer          not null, primary key
#  meal_id     :integer          not null
#  resident_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  multiplier  :integer          default(2), not null
#
# Indexes
#
#  index_meal_residents_on_meal_id_and_resident_id  (meal_id,resident_id)
#

require 'rails_helper'

describe MealResident do
  it 'can create a MealResident' do
    meal_resident = create(:meal_resident)
    expect(meal_resident).to be_valid
  end
end
