class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
      t.integer :user_id
      t.string :password
      t.string :salt

      t.timestamps null: false
    end
    add_index :user_accounts, :user_id, unique: true
  end
end
