class Admin::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:message] = "Post created successfully"
      redirect_to root_url
    else
      flash[:error] = @post.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
