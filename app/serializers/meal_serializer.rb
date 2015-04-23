# == Schema Information
#
# Table name: meals
#
#  id          :integer          not null, primary key
#  date        :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  bills_count :integer          default(0), not null
#
# Indexes
#
#  index_meals_on_date  (date) UNIQUE
#

class MealSerializer < ActiveModel::Serializer
  attributes :id,
             :date,

             # virtual attributes
             :number_of_attendees,
             :total_cost,
             :cost_per_adult
end
