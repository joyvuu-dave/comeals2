class BillSerializer < ActiveModel::Serializer
  attributes :id,
             :amount,

             # delegated attributes
             :date,
             :unit

  # associated models
  has_one :resident
end
