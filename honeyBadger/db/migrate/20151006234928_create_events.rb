class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :ID
      t.string :creator
      t.string :coordinates
      t.Date :date
      t.Time :startTime
      t.string :duration
      t.string :description
      t.string :category
      t.integer :minRequired

      t.timestamps null: false
    end
  end
end
