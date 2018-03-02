class ChartsController < ApplicationController
    before_action :set_chart, only: [:show, :edit, :update, :destroy]
  
    def index
      @charts = Chart.all
    end
  
    def show
      @chart = Chart.find(params[:id])
    end
  
    def new
      @chart = Chart.new
    end
  
    def edit
    end
  
    def create
      @chart = Chart.new(chart_params)
      if @chart.save
        redirect_to board_path @chart
      else
        render partial: "form"
      end
    end
  
    def update
      if @chart.update(chart_params)
        redirect_to board_path @chart
      else
        render partial: "form"
      end
    end
  
    def destroy
      @chart.destroy
      redirect_to boards_path
    end
  
    private
  
    def set_chart
      @chart = Chart.find(params[:id])
    end
  
    def chart_params
      params.require(:chart).permit(:name)
    end
  

  
end
