class CreateUsers < ActiveRecord::Migration
  def change
    create_table :userProfile do |t|
      t.string :userName
      t.string :fName
      t.string :lName
      t.string :email
      t.string :description
      t.double :shenaniganExp
      t.double :fitnessExp
      t.double :educationExp
      t.double :philanthropyExp
      t.string :picture
      t.array :friendsList
      t.array :ignoreList

      t.timestamps null: false
    end
  end
end
