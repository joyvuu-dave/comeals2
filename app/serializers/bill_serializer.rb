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

class BillSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  attributes :id,
             :amount,
             :reconciled,

             # delegated attribute
             :date,

             # virtual attribute
             :resident

  def amount
    number_to_currency(object.amount_decimal)
  end

  def resident
    object.resident.name
  end
end
