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

  has_many :guests, dependent: :destroy


  # Scope
  scope :adult, -> { where(multiplier: 2) }


  # VALIDATIONS
  validates :unit, presence: true
  validates :name, presence: true, uniqueness: true


  def balance
    sum_of_bills - total_meal_costs - total_guest_costs
  end


  # HELPERS
  def sum_of_bills
    bills.sum('amount')
  end


  def total_meal_costs
    result = 0
    meals.each do |meal|
      meal.bills.each do |bill|
        result += multiplier * bill.unit_cost
      end
    end
    result
  end


  def total_guest_costs
    result = 0
    guests.each do |guest|
      guest.meal.bills.each do |bill|
        result += guest.multiplier * bill.unit_cost
      end
    end
    result
  end
end
