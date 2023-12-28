class Category < ApplicationRecord
  has_one_attached :image
  has_many :category_product_links
  has_many :products, through: :category_product_links

  validates :name, presence: true, uniqueness: true
end
