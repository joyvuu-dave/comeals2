# == Schema Information
#
# Table name: residents
#
#  id                 :integer          not null, primary key
#  name               :string           not null
#  multiplier         :integer          default(2), not null
#  unit_id            :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  slug               :string
#  balance            :integer          default(0), not null
#  balance_updated_at :datetime
#
# Indexes
#
#  index_residents_on_name     (name) UNIQUE
#  index_residents_on_slug     (slug) UNIQUE
#  index_residents_on_unit_id  (unit_id)
#

class Resident < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  # ASSOCIATIONS
  belongs_to :unit, counter_cache: true

  has_many :bills, dependent: :destroy

  has_many :meal_residents, dependent: :destroy
  has_many :meals, through: :meal_residents

  has_many :guests, dependent: :destroy

  # Scope
  scope :adult, -> { where(multiplier: 2) }

  # NO WHITESPACE
  strip_attributes

  # VALIDATIONS
  validates :unit, presence: true
  validates :name, presence: true, uniqueness: true

  def accurate_balance
    if balance_updated_at.blank? || updated_at > balance_updated_at
      set_balance
      self.save!
    end
    balance
  end

  def set_balance
    self.balance = sum_of_bills - total_meal_costs - total_guest_costs

    time = Time.now
    self.updated_at = time
    self.balance_updated_at = time
  end

  private

  # HELPERS
  def sum_of_bills
    bills.unreconciled.sum('amount')
  end

  def total_meal_costs
    result = 0
    meal_residents.each do |meal_resident|
      meal_resident.meal.bills.unreconciled.each do |bill|
        result += meal_resident.multiplier * bill.unit_cost
      end
    end
    result
  end

  def total_guest_costs
    result = 0
    guests.each do |guest|
      guest.meal.bills.unreconciled.each do |bill|
        result += guest.multiplier * bill.unit_cost
      end
    end
    result
  end
end
