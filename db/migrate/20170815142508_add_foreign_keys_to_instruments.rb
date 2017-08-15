class AddForeignKeysToInstruments < ActiveRecord::Migration[5.0]
  def change
    add_reference :instruments, :user, foreign_key: true
    add_reference :instruments, :category, foreign_key: true
  end
end
