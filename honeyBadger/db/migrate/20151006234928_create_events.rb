class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :eventID
      t.string :creator
      t.string :coordinates
      t.datetime :date
      t.datetime :startTime
      t.string :duration
      t.string :description
      t.string :category
      t.integer :minRequired

      t.timestamps null: false
    end
  end
end
