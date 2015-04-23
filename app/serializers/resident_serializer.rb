# == Schema Information
#
# Table name: residents
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  multiplier :integer          default(2), not null
#  unit_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#
# Indexes
#
#  index_residents_on_name     (name) UNIQUE
#  index_residents_on_slug     (slug) UNIQUE
#  index_residents_on_unit_id  (unit_id)
#

class ResidentSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :multiplier,
             :balance

  # associated models
  has_one :unit
end
