module Api
  class RecordsController < ApplicationController
    respond_to :json

    def index
      records = {
        bills:     ActiveModel::ArraySerializer.new(Bill.all),
        meals:     ActiveModel::ArraySerializer.new(Meal.all),
        residents: ActiveModel::ArraySerializer.new(Resident.all),
        units:     ActiveModel::ArraySerializer.new(Resident.all)
      }

      respond_with(records)
    end
  end
end
