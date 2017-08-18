class Instrument < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_title_description, :against => [:title, :description]

  has_attachment :photo

  belongs_to :user
  belongs_to :category

  validates :user_id, :category_id, :title, :description, :price, :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def self.search_by_category(category)
    Category.where(name: category.split(", ")).map(&:instruments).flatten!
  end
end
