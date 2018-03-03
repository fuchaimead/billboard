class ChartsController < ApplicationController
    before_action :set_chart, only: [:show, :edit, :update, :chart_songs, :add_songs, :destroy]
  
    def index
      @charts = Chart.all
    end
  
    def show
    # @allsongs = Song.all #all songs period
    @selected_songs = Song.where(chart_id: @chart.id)
    # @songs = @chart.songs #all songs attached to this chart
    end

    def add_songs
      @all_available_songs = Song.where(chart_id: nil) #all songs not attached to this chart
    end 
  
    def chart_songs
      binding.pry
      # loop through and update the songs to have the chart id
      if params[:selected_songs]
        Song.where(id: params[:selected_song_ids]).update_all(chart_id: nil)
      else
        Song.where(id: params[:song_ids]).update_all(chart_id: @chart.id)
      end
      redirect_to chart_path(@chart.id), method: :get
    end

    def new
      @chart = Chart.new
    end
  
    def edit
    end
  
    def create
      @chart = Chart.new(chart_params)
      if @chart.save
        redirect_to chart_path @chart
      else
        render partial: "form"
      end
    end
  
    def update
      if @chart.update(chart_params)
        redirect_to chart_path @chart
      else
        render partial: "form"
      end
    end
  
    def destroy
      @chart.destroy
      redirect_to charts_path
    end
  
    private
  
    def set_chart
      @chart = Chart.find(params[:id])
    end
  
    def chart_params
      params.require(:chart).permit(:name)
    end
  

  
end
