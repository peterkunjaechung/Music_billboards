class SongsController < ApplicationController
  before_action :set_artist

  def new
    @song = Songs.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to billboard_artist_path(@artist.billboard_id, @artist)
    else
      render :new
    end
  end

  private
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def comment_params
      params.require(:comment).permit(:body, :author)
    end
end
