class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :manage, Post do |post|
      post.user == user
    end

    can :manage, Comment do |comment|
      comment.post.user == user || comment.user == user
    end
  end
end
