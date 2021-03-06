class Category < ApplicationRecord
  has_many :instruments, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
