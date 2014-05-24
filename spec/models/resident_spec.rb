# == Schema Information
#
# Table name: residents
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  multiplier :integer
#  balance    :integer
#  unit_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Resident do
  it 'can create a resident' do
    resident = create(:resident)
    expect(resident).to be_valid
  end
end
