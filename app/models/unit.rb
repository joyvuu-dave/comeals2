# == Schema Information
#
# Table name: units
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  balance         :integer          default(0), not null
#  residents_count :integer          default(0), not null
#
# Indexes
#
#  index_units_on_name  (name) UNIQUE
#

class Unit < ActiveRecord::Base
  # ASSOCIATION
  has_many :residents, dependent: :destroy


  # HELPERS
  def number_of_occupants
    residents.size
  end


  def set_balance
    bal = residents.sum('balance')
    self.balance = bal
    save
  end
end
