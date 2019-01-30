class SongsController < ApplicationController


get '/songs' do
  @songs = Song.all
  erb :"/songs/index"
 end

get '/songs/new' do
  erb :"/songs/new"
end

post '/songs' do
  params[:artist] = Artist.find_by_name(params[:artist])
  #binding.pry
  smtn = Song.create(params)
  redirect to  "/songs/#{smtn.slug}"
end

get '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])
  #binding.pry
  erb :"/songs/show"
end



end
