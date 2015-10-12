class CreateUsers < ActiveRecord::Migration
  def change
    create_table :userProfile do |t|
      t.string :userName
      t.string :fName
      t.string :lName
      t.string :email
      t.string :description
      t.float :shenaniganExp
      t.float :fitnessExp
      t.float :educationExp
      t.float :philanthropyExp
      t.string :picture
   #   t.array :friendsList
   #   t.array :ignoreList

      t.timestamps null: false
    end
  end
end
