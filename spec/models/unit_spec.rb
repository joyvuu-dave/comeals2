# == Schema Information
#
# Table name: units
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Unit do
  it 'can create a unit' do
    unit = create(:unit)
    expect(unit).to be_valid
  end
end
