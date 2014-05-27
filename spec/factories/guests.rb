# == Schema Information
#
# Table name: guests
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  multiplier :integer          default(2), not null
#  host_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_guests_on_host_id  (host_id)
#  index_guests_on_name     (name) UNIQUE
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :guest do
    name "MyString"
    multiplier 1
    host_id 1
  end
end
