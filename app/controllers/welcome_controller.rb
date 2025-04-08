class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    # @photos = Photo.all
    followed_users = current_user.followings
    @photos = Photo.where(user: followed_users + [ current_user ])
  end
end
