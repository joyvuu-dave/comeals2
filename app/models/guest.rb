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

class Guest < ActiveRecord::Base
  # ASSOCIATIONS
  belongs_to :meal
  belongs_to :resident


  # VALIDATIONS
  validates :meal, presence: true
  validates :resident, presence: true
end
