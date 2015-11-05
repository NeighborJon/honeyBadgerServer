class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :messageID
      t.string :user_ID
      t.string :recieverID
      t.string :message
      t.datetime :sent

      t.timestamps null: false
    end
  end
end
