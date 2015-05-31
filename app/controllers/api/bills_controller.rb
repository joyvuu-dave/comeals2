module Api
  class BillsController < ApplicationController
    def show
      render json: Bill.find_by_id(params[:id])
    end

    def index
      render json: Bill.all
    end
  end
end
