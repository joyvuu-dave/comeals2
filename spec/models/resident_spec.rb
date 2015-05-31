# == Schema Information
#
# Table name: residents
#
#  id                 :integer          not null, primary key
#  name               :string(255)      not null
#  multiplier         :integer          default(2), not null
#  unit_id            :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  slug               :string(255)
#  balance            :integer          default(0), not null
#  balance_updated_at :datetime
#
# Indexes
#
#  index_residents_on_name     (name) UNIQUE
#  index_residents_on_slug     (slug) UNIQUE
#  index_residents_on_unit_id  (unit_id)
#

require 'rails_helper'

describe Resident do
  it 'can create a Resident' do
    resident = create(:resident)
    expect(resident).to be_valid
  end
end
