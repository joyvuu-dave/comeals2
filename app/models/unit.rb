# == Schema Information
#
# Table name: units
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  residents_count :integer          default(0), not null
#  slug            :string(255)
#
# Indexes
#
#  index_units_on_name  (name) UNIQUE
#  index_units_on_slug  (slug) UNIQUE
#

class Unit < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  # ASSOCIATION
  has_many :residents, dependent: :destroy

  # NO WHITESPACE
  strip_attributes

  # VALIDATIONS
  validates :name, presence: true, uniqueness: true

  # HELPERS
  def number_of_occupants
    residents.size
  end

  def balance
    sum = 0
    residents.find_each do |resident|
      sum += resident.balance
    end
    sum
  end
end
