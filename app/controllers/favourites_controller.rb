class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
    post          =Post.friendly.find params[:post_id]
    favourite     =current_user.favourites.new
    current_user.favouritecount ||= 0
    current_user.favouritecount = current_user.favouritecount + 1
    @user = User.find current_user.id
    @user.favouritecount = current_user.favouritecount
    favourite.post=post
    if favourite.save && @user.save
      redirect_to post, notice: "Post favourited"
    else
      redirect_to post, alert: "Can't favourite"
    end
  end

  def destroy
    post  = Post.friendly.find params[:post_id]
    favourite = current_user.favourites.find params[:id]
    current_user.favouritecount ||= 0
    current_user.favouritecount = current_user.favouritecount - 1
    @user = User.find current_user.id
    @user.favouritecount = current_user.favouritecount
    if @user.save
      redirect_to post, notice: "Un-Favourited"
    else
      redirect_to post, alert: "Can't unfavourite"
    end
  end
end
