class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fName
      t.string :lName
      t.string :email
      t.string :description
      t.float :shenaniganExp
      t.float :fitnessExp
      t.float :educationExp
      t.float :philanthropyExp

      t.timestamps null: false
    end
  end
end
