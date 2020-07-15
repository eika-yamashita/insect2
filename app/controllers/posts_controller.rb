class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @q = Post.ransack(params[:posts])
    @category = Category.all
    @posts = @q.result(distinct: true).order(id: :desc)
  end

  def search
    @q = Post.search(search_params)
    @posts = @q.result(distinct: true).order(id: :desc)
  end

  def new
    @posts = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to(root_path)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:image, :name, :text)
  end

  def search_params
    params.require(:q).permit(:name_cont, :category_eq)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end

