# == Schema Information
#
# Table name: bills
#
#  id                :integer          not null, primary key
#  meal_id           :integer          not null
#  resident_id       :integer          not null
#  amount            :integer          default(0), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  amount_decimal    :decimal(12, 2)   default(0.0), not null
#  reconciled        :boolean          default(FALSE), not null
#  reconciliation_id :integer
#
# Indexes
#
#  index_bills_on_meal_id      (meal_id)
#  index_bills_on_resident_id  (resident_id)
#

class Bill < ActiveRecord::Base
  scope :unreconciled, -> { where(reconciled: false) }
  scope :reconciled, -> { where(reconciled: true) }

  default_scope { joins(:meal).order('meals.date DESC') }

  # ASSOCIATIONS
  belongs_to :meal, touch: true
  belongs_to :resident, touch: true
  belongs_to :reconciliation

  delegate :multiplier, to: :meal
  delegate :date, to: :meal
  delegate :unit, to: :resident

  # VALIDATIONS
  validates :meal, presence: true
  validates :resident, presence: true
  validates :amount_decimal, numericality: { greater_than_or_equal_to: 0.01 }
  validates :resident_id, uniqueness: { scope: :meal_id, message: 'resident already has a bill for this meal' }

  # CALLBACKS
  before_save :set_amount
  after_commit :set_reconciled, on: [:create, :update] # Note: putting this in a before_save callback causes operation to fail

  def set_amount
    self.amount = Integer(amount_decimal * 100)
  end

  def set_reconciled
    if reconciliation.present?
      update_column(:reconciled, true)
    else
      update_column(:reconciled, false)
    end
  end

  # VIRTUAL ATTRIBUTE
  def unit_cost
    multiplier > 0 ? adj_amount / multiplier : 0
  end

  # HELPERS

  private

  def adj_amount
    amount + diff
  end

  def diff
    mod == 0 ? 0 : (multiplier - mod).abs
  end

  def mod
    multiplier > 0 ? amount % multiplier : 0
  end
end
