class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :user_ID
      t.string :recieverID
      t.string :message

      t.timestamps null: false
    end
  end
end
