# == Schema Information
#
# Table name: units
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  balance         :integer          default(0), not null
#  residents_count :integer          default(0), not null
#
# Indexes
#
#  index_units_on_name  (name) UNIQUE
#

require 'spec_helper'

describe Unit do
  it 'can create a unit' do
    unit = create(:unit)
    expect(unit).to be_valid
  end
end
