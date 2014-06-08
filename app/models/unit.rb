# == Schema Information
#
# Table name: units
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  residents_count :integer          default(0), not null
#
# Indexes
#
#  index_units_on_name  (name) UNIQUE
#

class Unit < ActiveRecord::Base
  # ASSOCIATION
  has_many :residents, dependent: :destroy


  # VALIDATIONS
  validates :name, presence: true, uniqueness: true


  # HELPERS
  def number_of_occupants
    residents.size
  end


  def balance
    @balance ||= calculate_balance
  end


  private
    def calculate_balance
      sum = 0
      residents.each do |resident|
        sum += resident.balance
      end
      sum
    end
end
