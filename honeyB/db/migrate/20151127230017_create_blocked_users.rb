class CreateBlockedUsers < ActiveRecord::Migration
  def change
    create_table :blocked_users do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :blocked, index: true
    	t.index [:user_id, :blocked_id], unique: true
    	
    	t.timestamps null: false
    end
  end
end
