# == Schema Information
#
# Table name: bills
#
#  id          :integer          not null, primary key
#  meal_id     :integer
#  resident_id :integer
#  cost        :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Bill < ActiveRecord::Base

  belongs_to :meal
  belongs_to :resident


  private

  def set_unit_cost
    mod = cost % meal.multiplier

    if mod == 0
      diff = 0
    else
      diff = Math.abs(meal.multiplier - mod)
    end

    adj_amount =
  end

end


#  var mod,
#     diff,
#     adjAmount;

# mod = self.amount % meal.multiplier;

# if(mod === 0) {
#     diff = 0;
# } else {
#     diff = Math.abs(meal.multiplier - mod);
# }

# adjAmount = self.amount + diff;
# self.unitcost = adjAmount / meal.multiplier;
# return self;
