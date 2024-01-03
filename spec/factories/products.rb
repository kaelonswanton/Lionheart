FactoryBot.define do
  factory :product do
    name { "Product 1" }
    description { "Description 1" }
    price { "99.99" }
    image { Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'backup.jpg')) }
  end
end
