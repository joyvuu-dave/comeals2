# == Schema Information
#
# Table name: residents
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  multiplier :integer          default(2), not null
#  unit_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_residents_on_name  (name) UNIQUE
#

class Resident < ActiveRecord::Base
  # ASSOCIATIONS
  belongs_to :unit, counter_cache: true

  has_many :bills, dependent: :destroy
  has_many :meal_residents, dependent: :destroy
  has_many :meals, through: :meal_residents


  # VALIDATIONS
  validates :unit, presence: true


  def balance
    total_bills - total_meals
  end


  # HELPERS
  def total_bills
    bills.sum('amount')
  end


  def total_meals
    result = 0
    meals.each do |meal|
      meal.bills.each do |bill|
        result += multiplier * bill.unit_cost
      end
    end
    result
  end
end
