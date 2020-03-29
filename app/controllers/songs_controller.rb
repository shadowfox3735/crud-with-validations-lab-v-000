class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  
  def show
  end
  
  def edit
  end
  
  def new
    @song = Song.new
  end
  
  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end
  
  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end
  
  private
  
  def find_song
    @song = Song.find(params[:id])
  end
  
  def song_params(*args)
    params.require(:song).permit(*args)
  end
end