class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :user, index: true
      t.integer :messageID
      t.string :recieverID
      t.string :message
      t.datetime :time

      t.timestamps null: false
    end
  end
end
