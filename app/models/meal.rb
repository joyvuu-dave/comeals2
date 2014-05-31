# == Schema Information
#
# Table name: meals
#
#  id          :integer          not null, primary key
#  date        :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  bills_count :integer          default(0), not null
#
# Indexes
#
#  index_meals_on_date  (date) UNIQUE
#

class Meal < ActiveRecord::Base
  # ASSOCIATIONS
  has_many :meal_residents, dependent: :destroy
  has_many :residents, through: :meal_residents

  has_many :guests, dependent: :destroy
  has_many :bills, dependent: :destroy


  accepts_nested_attributes_for :meal_residents, :guests, allow_destroy: true


  # VALIDATIONS
  validates :date, presence: true



  # HELPERS
  def number_of_diners
    residents.size + guests.size
  end


  def multiplier
    residents.sum('multiplier') + guests.sum('multiplier')
  end


  def total_cost
    bills.sum('amount')
  end
end
