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
      flash.now[:error] = @post.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:message] = "Post updated successfully"
      redirect_to @post
    else
      flash.now[:error] = @post.errors.full_messages.join(", ")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:message] = "Post deleted successfully"
    redirect_to root_url
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
