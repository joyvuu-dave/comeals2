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

class MealResident < ActiveRecord::Base
  # ASSOCIATIONS
  belongs_to :meal
  belongs_to :resident, touch: true

  # CALLBACKS
  before_save :set_multiplier

  private

  def set_multiplier
    self.multiplier = resident.multiplier
  end
end
