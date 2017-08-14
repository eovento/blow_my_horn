class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.date :checkout
      t.date :checkin
      t.boolean :blocked

      t.timestamps
    end
  end
end
