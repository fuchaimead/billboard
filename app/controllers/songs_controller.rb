class SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :edit, :destroy]
  before_action :set_artist

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end 

  def update
    if @song.update(song_params)
      redirect_to artist_song_path(@artist, @song)
    else
      render :edit
    end
  end
 

  def edit
  end
  
  def destroy
    @song.destroy
    redirect_to artist_songs_path
  end

  private
  def set_artist
   @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = Song.find(params[:id])
  end 

  def song_params
    params.require(:song).permit(:title)
  end 

end

