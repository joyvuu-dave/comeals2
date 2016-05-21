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

class ResidentSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  attributes :id,
             :name,
             :balance,

             # Virtual Attribute
             :price_category,
             :unit


  def balance
    number_to_currency(object.accurate_balance.to_f / 100)
  end

  def price_category
    if object.multiplier == 2
      'Adult'
    elsif object.multiplier == 1
      'Child'
    else
      # Note: this would only be used if we allowed custom multiplier input
      "Adult x #{number_with_precision((object.multiplier.to_f / 2), precision: 1, strip_insignificant_zeros: true)}"
    end
  end

  def unit
    object.unit.name
  end
end
