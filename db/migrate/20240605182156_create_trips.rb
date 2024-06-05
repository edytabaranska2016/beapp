class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :start_address, null: false
      t.string :destination_address, null: false
      t.decimal :price, precision: 8, scale: 2, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
