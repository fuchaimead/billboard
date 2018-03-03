class SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :edit, :destroy]
  before_action :set_artist

  def index
    @songs = @artist.songs
  end

  def show

  end

  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_songs_path
    else
      render :new
    end
  end 

  def update
    if @song.update(song_params)
      redirect_to artist_songs_path(@artist)
    else
      render :edit
    end
  end
 

  def edit
  end
  
  def destroy
    @song.destroy
    redirect_to chart_path(@chart)
  end

  private
  def set_artist
   @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = Song.find(params[:id])
  end 

  def song_params
    params.require(:song).permit(:title, :chart_id)
  end 

end

