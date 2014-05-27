# == Schema Information
#
# Table name: residents
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  multiplier :integer          default(2), not null
#  balance    :integer          default(0), not null
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


  # CALLBACKS
  after_update :set_unit_balances


  # HELPERS
  def set_balance
    bal = total_bills - total_meals
    self.balance = bal
    save
  end


  def total_bills
    bills.sum('amount')
  end


  def total_meals
    result = 0
    meals.each do |meal|
      meal.bills.each do |bill|
        result = result - (multiplier * bill.unit_cost)
      end
    end
    result
  end


  def set_unit_balances
    unit.set_balance
  end
end
