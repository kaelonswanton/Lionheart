require 'rails_helper'

RSpec.describe Product, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:image) }
  end

  context "associations" do
    it { should have_many(:category_product_links) }
    it { should have_many(:categories) }
    it { should have_one_attached(:image) }
  end
end
