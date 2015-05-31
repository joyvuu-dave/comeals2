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
# Indexes
#
#  index_guests_on_meal_id      (meal_id)
#  index_guests_on_resident_id  (resident_id)
#
class Guest < ActiveRecord::Base
  # ASSOCIATIONS
  belongs_to :meal
  belongs_to :resident, touch: true

  # NO WHITESPACE
  strip_attributes

  # VALIDATIONS
  validates :name, uniqueness: { scope: [:meal_id,  :resident_id] }
end
