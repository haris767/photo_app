class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    if current_user
      @followings = current_user.followings
      @photos = Photo.where(user: current_user.followings + [ current_user ])
    else
      redirect_to new_user_session_path, alert: "You need to sign in first."
    end
  end
end
