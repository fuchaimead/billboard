class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update, :edit, :destroy]

  def show
  end

  def edit
  end

  def update
  end

  def index
    @artist = Artist.all
  end

  def new
    @artist = Artist.new 
  end
  
  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end 



  def destroy
    @artist.destroy
    redirect_to artists_path
  end 

  private

  def artist_params
    params.require(:artist).permit(:name)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end 
  
end
