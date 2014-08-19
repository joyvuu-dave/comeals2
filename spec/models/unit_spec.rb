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

require 'rails_helper'

describe Unit do
  it 'can create a Unit' do
    unit = create(:unit)
    expect(unit).to be_valid
  end
end
