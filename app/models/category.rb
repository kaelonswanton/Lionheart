class Category < ApplicationRecord
  has_one_attached :image
  has_many :products, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
