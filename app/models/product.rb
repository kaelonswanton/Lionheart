class Product < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["category", "description", "name", "price"]
  end
end
