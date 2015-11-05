class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :creator
      t.string :xVal
      t.string :yVal
      t.datetime :start
      t.string :duration
      t.string :description
      t.string :category
      t.integer :minReq

      t.timestamps null: false
    end
  end
end
