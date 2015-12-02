class CreateEventMembers < ActiveRecord::Migration
  def change
    create_table :event_members, id: false do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :event, index: true
#    	t.boolean :checkedin, default: false
    	t.index [:user_id, :event_id], unique: true
    	
    	t.timestamps null: false
    end
  end
end
