# == Schema Information
#
# Table name: meals
#
#  id          :integer          not null, primary key
#  date        :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  bills_count :integer          default(0), not null
#
# Indexes
#
#  index_meals_on_date  (date) UNIQUE
#

require 'spec_helper'

describe Meal do
  it 'can create a Meal' do
    meal = create(:meal)
    expect(meal).to be_valid
  end
end
