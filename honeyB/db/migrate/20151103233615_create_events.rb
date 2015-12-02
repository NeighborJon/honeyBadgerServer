class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :creator, index: true
      t.string :title
      t.float :longitude, null:false
      t.float :latitude, null:false
      t.datetime :start, null:false
      t.string :duration
      t.string :description
      t.string :category
      t.integer :minReq
      t.boolean :private, default: false

      t.timestamps null: false
    end
  end
end
