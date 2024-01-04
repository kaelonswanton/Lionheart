class Product < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["category", "description", "name", "price"]
  end
  has_many :category_product_links, dependent: :destroy
  has_many :categories, through: :category_product_links
  has_many :line_items, dependent: :destroy
  has_one_attached :image
  #allows to create a category from the product form
  #accepts_nested_attributes_for :categories, reject_if: :all_blank

  validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
