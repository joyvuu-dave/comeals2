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
#
# Indexes
#
#  index_residents_on_name  (name) UNIQUE
#

require 'spec_helper'

describe Resident do
  it 'can create a resident' do
    resident = create(:resident)
    expect(resident).to be_valid
  end
end
