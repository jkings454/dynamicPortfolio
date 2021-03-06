class PostsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
    if params[:search]
     @posts = Post.search(params[:search]).order("created_at DESC")
   else
     @posts = Post.all.order('created_at DESC')
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(:post_id => @post.id )
    @comment = Comment.new(:post => @post)
  end
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "post successfully created!"
      redirect_to '/blog'
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "deletion successful"
    redirect_to '/blog'
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
