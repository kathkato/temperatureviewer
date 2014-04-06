class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.string :zip
      t.decimal :lat
      t.decimal :lon

      t.timestamps
    end
  end
end
