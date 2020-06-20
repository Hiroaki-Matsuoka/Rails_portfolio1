class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(
      title: post_params[:title],
      message: post_params[:message],
      user_id: current_user.id
    )
    redirect_to posts_path
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

private
  def post_params
    params.permit(:title, :message, :user_id)
  end
end
