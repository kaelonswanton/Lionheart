class Product < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["category", "description", "name", "price"]
  end
  has_many :category_product_links
  has_many :categories, through: :category_product_links
  has_one_attached :image

  validates :name, presence: true
end
