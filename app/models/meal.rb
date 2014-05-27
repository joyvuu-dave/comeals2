# == Schema Information
#
# Table name: meals
#
#  id          :integer          not null, primary key
#  date        :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  multiplier  :integer          default(0), not null
#  total_cost  :integer          default(0), not null
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

  has_many :bills, dependent: :destroy


  accepts_nested_attributes_for :meal_residents, allow_destroy: true


  # CALLBACKS
  after_create :set_multiplier_on_create


  before_save(on: :edit) do
    self.multiplier = residents.sum('multiplier')
  end




  # HELPERS
  def number_of_diners
    residents.size
  end


  def set_multiplier_on_create
    mult = residents.sum('multiplier')
    self.multiplier = mult
    save
  end


  def set_total_cost
    cost = bills.sum('amount')
    self.total_cost = cost
    save
  end
end
