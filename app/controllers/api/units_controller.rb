module Api
  class UnitsController < ApplicationController
    def show
      render json: Unit.find_by_id(params[:id])
    end

    def index
      render json: Unit.all
    end
  end
end
