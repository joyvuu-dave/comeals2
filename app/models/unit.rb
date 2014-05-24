# == Schema Information
#
# Table name: units
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Unit < ActiveRecord::Base

  has_many :residents


  private
    def calculate_balance

    end

end
