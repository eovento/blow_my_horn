class AddForeignKeysToRentals < ActiveRecord::Migration[5.0]
  def change
    add_reference :rentals, :user, foreign_key: true
    add_reference :rentals, :instrument, foreign_key: true
  end
end
