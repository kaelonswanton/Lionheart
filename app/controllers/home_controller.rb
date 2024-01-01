class HomeController < ApplicationController
  def home
    @categories = Category.limit(3)
    @posts = Post.limit(2)
  end

  def about
  end

  def contact
  end
end
