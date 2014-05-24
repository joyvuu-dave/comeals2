# == Schema Information
#
# Table name: meals
#
#  id         :integer          not null, primary key
#  date       :datetime
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Meal do
  it 'can create a meal' do
    meal = create(:meal)
    expect(meal).to be_valid
  end
end
