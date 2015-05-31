module Api
  class MealsController < ApplicationController
    def show
      render json: Meal.find_by_id(params[:id])
    end

    def index
      render json: Meal.all
    end
  end
end
