class Instrument < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :user_id, :category_id, :title, :description, :price, :location, presence: true
end
