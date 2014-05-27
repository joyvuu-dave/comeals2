# == Schema Information
#
# Table name: meal_residents
#
#  id          :integer          not null, primary key
#  meal_id     :integer          not null
#  resident_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_meal_residents_on_meal_id_and_resident_id  (meal_id,resident_id)
#

require 'spec_helper'

describe MealResidents do
  pending "add some examples to (or delete) #{__FILE__}"
end
