class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userName
      t.string :fName, default: "User"
      t.string :lName, default: "Loser"
      t.string :email
      t.string :description
      t.string :avatar_path, default: "http://clickmedix.com/home/wp-content/uploads/2011/12/504px-Android_robot-252x300.png"
      t.string :category
      t.float :shenaniganExp
      t.float :fitnessExp
      t.float :educationExp
      t.float :philanthropyExp

      t.timestamps null: false
    end
  end
end
