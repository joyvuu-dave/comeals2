class UnitSerializer < ActiveModel::Serializer
  attributes :id,
             :name,

             # virtual attributes
             :balance,
             :number_of_occupants
end
