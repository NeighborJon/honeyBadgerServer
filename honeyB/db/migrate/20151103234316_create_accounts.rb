class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :user_ID
      t.string :email
      t.string :password
      t.string :auth_token

      t.timestamps null: false
    end
  end
end
