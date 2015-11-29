class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
        t.belongs_to :user, index: true
    	t.belongs_to :friend, index: true
    	t.index [:user_id, :friend_id], unique: true
    	
    	t.timestamps null: false
    end
  end
end
