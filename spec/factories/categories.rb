FactoryBot.define do
  factory :category do
    name { "Category 1" }
    image { Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'backup.jpg')) }
    description { Faker::Lorem.words(number: 10).join(' ') }
  end
end
