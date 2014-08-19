class MealSerializer < ActiveModel::Serializer
  attributes :id,
             :date,

             # virtual attributes
             :number_of_attendees,
             :total_cost,
             :cost_per_adult
end
