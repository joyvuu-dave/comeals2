# == Schema Information
#
# Table name: bills
#
#  id          :integer          not null, primary key
#  meal_id     :integer          not null
#  resident_id :integer          not null
#  amount      :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  unit_cost   :integer          default(0), not null
#
# Indexes
#
#  index_bills_on_meal_id      (meal_id)
#  index_bills_on_resident_id  (resident_id)
#

class Bill < ActiveRecord::Base
  # ASSOCIATIONS
  belongs_to :meal, counter_cache: true
  belongs_to :resident


  delegate :multiplier, to: :meal


  # VALIDATION
  validates :meal, presence: true
  validates :resident, presence: true


  # CALLBACKS
  before_save(on: :edit) do
    self.unit_cost = multiplier > 0 ? adj_amount / multiplier : 0
  end

  after_create :set_unit_cost_on_create
  after_update :set_resident_balances
  after_update :set_meal_total_cost


  # HELPERS
  def mod
    multiplier > 0 ? amount % multiplier : 0
  end


  def diff
    mod == 0 ? 0 : (multiplier - mod).abs
  end


  def adj_amount
    amount + diff
  end


  def set_unit_cost_on_create
    cost = multiplier > 0 ? adj_amount / multiplier : 0
    self.unit_cost = cost
    save
  end


  def set_resident_balances
    meal.residents.each do |resident|
      resident.set_balance
    end
  end


  def set_meal_total_cost
    meal.set_total_cost
  end
end
