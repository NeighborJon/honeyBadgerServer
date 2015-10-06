class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :ID
      t.string :senderID
      t.string :recieverID
      t.string :message
      t.Date :time

      t.timestamps null: false
    end
  end
end
