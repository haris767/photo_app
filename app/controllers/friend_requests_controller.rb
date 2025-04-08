# app/controllers/friend_requests_controller.rb

class FriendRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    receiver = User.find(params[:receiver_id])
    unless current_user.sent_friend_requests.exists?(receiver_id: receiver.id)
      current_user.sent_friend_requests.create(receiver: receiver, status: "pending")
    end
    redirect_to friends_path, notice: "Friend request sent to #{receiver.email}"
  end

  def update
    request = FriendRequest.find(params[:id])
    if request.receiver == current_user
      request.update(status: "accepted")
      redirect_to friends_path, notice: "Friend request accepted!"
    else
      redirect_to friends_path, alert: "Not authorized"
    end
  end

  def destroy
    request = FriendRequest.find(params[:id])
    if request.sender == current_user || request.receiver == current_user
      request.destroy
      redirect_to friends_path, notice: "Friend request canceled/rejected"
    else
      redirect_to friends_path, alert: "Not authorized"
    end
  end



def unfriend
  friend = User.find(params[:id])
  request = FriendRequest.where(
    "(sender_id = :user1 AND receiver_id = :user2) OR (sender_id = :user2 AND receiver_id = :user1)",
    user1: current_user.id, user2: friend.id
  ).where(status: "accepted").first

  if request
    request.destroy
    redirect_to friends_path, notice: "Unfriended #{friend.email}"
  else
    redirect_to friends_path, alert: "Friendship not found"
  end
end
end
