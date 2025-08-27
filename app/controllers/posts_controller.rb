class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ] # ログインしているかどうかを判断

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:notice] = "\u6295\u7A3F\u3057\u307E\u3057\u305F"
      redirect_to root_path
    else
      flash[:alert] = "\u6295\u7A3F\u306B\u5931\u6557\u3057\u307E\u3057\u305F"
      render :new
    end
  end

  def show
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
