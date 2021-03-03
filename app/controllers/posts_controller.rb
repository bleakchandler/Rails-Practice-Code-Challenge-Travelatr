class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @destinations = Destination.all
    @bloggers = Blogger.all
  end

  def create
    post_params = params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    @new_post = Post.create(post_params)
    redirect_to bloggers_path
  end
end
