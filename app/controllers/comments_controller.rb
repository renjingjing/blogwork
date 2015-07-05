class CommentsController < ApplicationController
    def new
        @comment=Comment.new
    end

    def show
      @post = Post.find(params[:id])
      render "/posts/show"
    end


    def create
    @post=Post.find params[:post_id]
    @comment=Comment.new comment_params
    @comment.post = @post
    @comment.user_id = current_user.id
      if @comment.save
        # BlogMailer.notify_post_owner(@comment).deliver_now
        BlogMailer.delay.notify_post_owner(@comment)
        redirect_to post_path(@post)
      else
        render :show
      end
    end

    def destroy
      post=Post.find params[:post_id]
      @comment=Comment.find params[:id]
      @comment.destroy
      redirect_to post_path(post)
    end
    def comment_params
    params.require(:comment).permit(:body)
    end

    def comment_params
    params.require(:comment).permit(:body ,:post, :user)
    end
end
