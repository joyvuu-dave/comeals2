class ResidentSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :multiplier,
             :balance

  # associated models
  has_one :unit
end
