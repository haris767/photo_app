class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @photos = @user.photos
  end

  def follow
    user = User.find(params[:id])
    current_user.followings << user unless current_user.followings.include?(user)
    redirect_to user_path(user), notice: "Now following #{user.email}"
  end

  def unfollow
    user = User.find(params[:id])
    current_user.followings.delete(user)
    redirect_to user_path(user), notice: "Unfollowed #{user.email}"
  end
end
