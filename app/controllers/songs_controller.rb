class SongsController < ApplicationController
  def index
    songs = Song.all
    render json: songs
  end

  def show
    select_song = Song.find(params[:id])
    render json: select_song
   
  end 
  
  def create
    song = Song.new(
    title: params[:title],
    album: params[:album],
    artist: params[:artist],
    year: params[:year]
    ).save
    render json: song.as_json
  end 

  def update
    ### Find correct song
    song = Song.find(params[:id])

    song.title = params[:title] || song.title
    song.album = params[:album] || song.album
    song.artist = params[:artist] || song.artist
    song.year = params[:year] || song.year
    song.save
    render json: song 
  end
  
  def delete
    song = Song.find(params[:id])
    song.delete
    render json: {message: "Deleted"}
  end
  
end


