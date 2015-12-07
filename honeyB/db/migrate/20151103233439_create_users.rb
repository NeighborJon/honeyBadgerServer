class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userName
      t.string :fName, default: ""
      t.string :lName, default: ""
      t.string :email
      t.string :description, default: ""
      t.string :avatar_path
      t.string :category
      t.float :shenaniganExp, default: 0.0
      t.float :fitnessExp, default: 0.0
      t.float :educationExp, default: 0.0
      t.float :philanthropyExp, default: 0.0

      t.timestamps null: false
    end
  end
end
