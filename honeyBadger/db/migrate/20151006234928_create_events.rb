class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.float :latitude
      t.float :longitude
      t.datetime :startTime
      t.datetime :endTime
      t.string :description
      t.string :category
      t.integer :minRequired
      t.boolean :private, default: true

      t.timestamps null: false
    end
  end
end
