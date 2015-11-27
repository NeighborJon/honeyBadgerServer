class CreateFriendInvites < ActiveRecord::Migration
  def change
    create_table :friend_invites do |t|
      t.belongs_to :sender, index: true
      t.belongs_to :receiver, index: true
      t.string :token, default: "test"
      t.boolean :accepted, default: false
      t.index [:sender_id, :receiver_id], unique: true
      
      t.timestamps null: false
    end
  end
end
