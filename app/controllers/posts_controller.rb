class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @posts=Post.all
    @posts = Post.page(params[:page]).per(10)
  end

  def new
    @post=Post.new
    @comment=Comment.new
  end

  def show
  @comment = Comment.new
  @favourite=@post.favourite_for(current_user)
  end

  def create
  @post=Post.new post_params
  @post.user  = current_user
  # @post.assetfile=full_filename(post_params[:assetfile])
  # debugger
    if @post.save
      redirect_to posts_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post.slug = nil
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end



  private

  def find_post
    @post = Post.friendly.find params[:id]
  end

  def post_params
  params.require(:post).permit(:title, :body ,:category_id, {tag_ids:[]}, :assetfile)
  end

  def authorize
    redirect_to root_path, alert: "access denied" unless can? :manage, @post
  end

end
