module Api
  class ResidentsController < ApplicationController
    def show
      render json: Resident.find_by_id(params[:id])
    end

    def index
      render json: Resident.all
    end
  end
end
