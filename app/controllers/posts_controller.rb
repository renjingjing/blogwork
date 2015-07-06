class PostsController < ApplicationController
  def index
    @posts=Post.all
    @posts = Post.page(params[:page]).per(10)
  end

  def new
    @post=Post.new
    @comment=Comment.new
  end

  def show
  @post=Post.friendly.find params[:id]
  @favourite=@post.favourite_for(current_user)
  end

  def create
  @post=Post.new post_params
  @post.user_id  = current_user.id
    if @post.save
      redirect_to posts_path(@post)
    else
      render :new
    end
  end

  def edit
    @post=Post.friendly.find params[:id]
  end

  def update
    @post=Post.friendly.find params[:id]
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post=Post.friendly.find params[:id]
    @post.destroy
    redirect_to posts_path
  end

  def post_params
  params.require(:post).permit(:title, :body ,:category_id, {tag_ids:[]})
  end
end
