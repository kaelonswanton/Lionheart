require 'mini_magick'

images = ['wallets']

images.each do |image_name|
  image = MiniMagick::Image.open("app/assets/images/#{image_name}.webp")
  image.format('jpg')
  new_image_path = "app/assets/images/#{image_name}.jpg"
  image.write(new_image_path)
end