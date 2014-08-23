# == Schema Information
#
# Table name: reconciliations
#
#  id         :integer          not null, primary key
#  date       :date             not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_reconciliations_on_date  (date) UNIQUE
#

class Reconciliation < ActiveRecord::Base
  has_many :bills

  before_validation :set_date
  after_save :reconcile_bills, on: :create # Note: needs to be an after_save so the id exists
  after_commit :unreconcile_bills, on: :destroy

  validates :date, presence: true

  def set_date
    self.date = Time.now
  end

  def reconcile_bills
    Bill.unreconciled.find_each do |i|
      i.update_columns(reconciliation_id: id, reconciled: true)
    end
  end

  def unreconcile_bills
    bills.find_each do |i|
      i.update_columns(reconciliation_id: nil, reconciled: false)
    end
  end
end
