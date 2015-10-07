class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
      t.string :ID
      t.password :password

      t.timestamps null: false
    end
  end
end
