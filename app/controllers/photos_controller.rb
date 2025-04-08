class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, only: [ :show, :edit, :update, :destroy ]

  def index
    followed_users = current_user.followings
    @photos = Photo.where(user: followed_users + [ current_user ])
    # @photos = current_user.photos
  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to root_path, notice: "Photo uploaded successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to photos_path, notice: "Photo updated!"
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path, notice: "Photo deleted!"
  end
  def by_date
    date = params[:date]
    @photos = current_user.photos.where("DATE(created_at) = ?", Date.parse(date))
    render :index
  end

  private

  def set_photo
    @photo = current_user.photos.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :file)
  end
end
