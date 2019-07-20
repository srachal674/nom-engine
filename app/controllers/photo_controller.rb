class PhotoController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
    @photo = Photo.new
    
    @place.photos.create(photo_params.merge(user: current_user))
    redirect_to place_path(@place)
  end

  private

  def photo_params
    params.require(:picture).permit(:message)
  end
end
