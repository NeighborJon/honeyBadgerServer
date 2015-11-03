class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :user, index: true
      t.integer :eventID
      t.float :latitude
      t.float :longitude
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
