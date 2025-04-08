class DropFriendrequestTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :friend_requests
  end
end
