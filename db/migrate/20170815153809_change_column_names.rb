class ChangeColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :rentals, :checkout, :start_date
    rename_column :rentals, :checkin, :end_date
    remove_column :rentals, :blocked
  end
end
