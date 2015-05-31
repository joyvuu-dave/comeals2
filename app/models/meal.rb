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

  accepts_nested_attributes_for :meal_residents, :guests, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? || attributes['resident_id'].blank? }

  # VALIDATIONS
  validates :date, presence: true, uniqueness: true

  # CALLBACKS
  after_commit :touch_meal_residents_and_guests

  def touch_meal_residents_and_guests
    meal_residents.find_each(&:touch)
    guests.find_each(&:touch)
  end

  # VIRTUAL ATTRIBUTES
  def number_of_attendees
    residents.count + guests.count
  end

  def multiplier
    meal_residents.sum('multiplier') + guests.sum('multiplier')
  end

  def reconciled
    # If there aren't any bills or any of the associated bills
    # are unreconciled, then we treat this meal as unreconciled
    bills_count > 0 && bills.all? { |b| b['reconciled'] == true }
  end

  # TODO: add counter_culture
  def total_cost
    bills.sum('amount')
  end

  def cost_per_adult
    result = 0
    bills.each do |bill|
      result += bill.unit_cost
    end
    result * 2
  end

  def self.average_cost_per_adult
    cost_per_adult_sum = 0
    Meal.all.each do |i|
      cost_per_adult_sum += i.cost_per_adult
    end

    format('%0.02f', (cost_per_adult_sum.to_f / Meal.count(true)).round / 100.to_f) if Meal.count(true) > 0
  end

  def self.average_number_of_attendees
    number_of_attendees_sum = 0
    Meal.all.each do |i|
      number_of_attendees_sum += i.number_of_attendees
    end

    format('%0.01f', number_of_attendees_sum.to_f / Meal.count(true)) if Meal.count(true) > 0
  end
end
