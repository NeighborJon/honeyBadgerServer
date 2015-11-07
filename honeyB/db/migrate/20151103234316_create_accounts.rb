class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :user, index: true, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :auth_token

      t.timestamps null: false
    end
    add_reference :accounts, :email, references: :users
  end
end
