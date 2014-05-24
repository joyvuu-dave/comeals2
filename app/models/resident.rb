# == Schema Information
#
# Table name: residents
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  multiplier :integer
#  balance    :integer
#  unit_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Resident < ActiveRecord::Base

  belongs_to :unit

  has_many :attendances
  has_many :bills


  private
    def calculate_balance

    end

end
