# == Schema Information
#
# Table name: meals
#
#  id         :integer          not null, primary key
#  date       :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Meal < ActiveRecord::Base

  has_many :attendances
  has_many :bills

end
