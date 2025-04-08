class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    photo = Photo.find(params[:photo_id])
    photo.likes.create(user: current_user)
    redirect_back fallback_location: root_path
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy if like.user == current_user
    redirect_back fallback_location: root_path
  end
end
