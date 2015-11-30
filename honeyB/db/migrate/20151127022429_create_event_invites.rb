class CreateEventInvites < ActiveRecord::Migration
  def change
    create_table :event_invites do |t|
      t.belongs_to :event, index: true
      t.belongs_to :receiver, index: true
      t.boolean :accepted, default: false
      t.string :token, default: "test"
      t.index [:event_id, :receiver_id], unique: true
      
      t.timestamps null: false
    end
  end
end
