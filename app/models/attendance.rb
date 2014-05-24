# == Schema Information
#
# Table name: attendances
#
#  id          :integer          not null, primary key
#  resident_id :integer
#  meal_id     :integer
#  multiplier  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Attendance < ActiveRecord::Base

  belongs_to :meal
  belongs_to :resident

end
