class CommentsController < ApplicationController
    def new
        @comment=Comment.new
    end

    def show
      @post = Post.friendly.find(params[:id])
      render "/posts/show"
    end


    def create
    @post        = Post.friendly.find params[:post_id]
    @comment=Comment.new comment_params
    @comment.post = @post
    @comment.user_id = current_user.id

      respond_to do |format|
      if @comment.save
        BlogMailer.delay.notify_post_owner(@comment)
        format.html { redirect_to post_path(@post), notice: "comment created" }
        format.js   { render  } # this renders: create.js.erb
      else
        # we use the full path because if we do render :show it will look for
        # a template called show.html.erb within the /app/views/answers folder
        format.html { render "/posts/show" }
        format.js   { render js: "alert('failure');"}
      end
    end
    end

    def destroy
      post=Post.friendly.find params[:post_id]
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
