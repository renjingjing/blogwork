class BlogMailer < ApplicationMailer
  def notify_post_owner(comment)
  @comment   = comment
  @post = comment.post
  @user = User.find (@post.user_id)
  mail(to: "mike12066@gmail.com", subject: "you got an new comment") #@user.email
  end
end
