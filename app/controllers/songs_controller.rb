 class SongsController < ApplicationController

     def create
       @song =  Song.create(strong_params(:name, :artist_id, :genre_id))
       if @song.persisted?
        render :show
       end
     end

     def new
     @song = Song.new
     end

     def edit
       @song = set_song
     end

     def show
       @song = set_song
     end

     def update
       @song = set_song
       @song.update(strong_params(:name) )
       render :show
     end


  private

       def set_song
         Song.find_by(params[:id])
       end

       def strong_params(*args)
     params.require(:song).permit(args)
       end



 end
