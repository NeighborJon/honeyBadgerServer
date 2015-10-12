class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :messageID
      t.string :senderID
      t.string :recieverID
      t.string :message
      t.datetime :time

      t.timestamps null: false
    end
  end
end
