class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favouriting_users, through: :favourites, source: :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :title, presence: {message: "must be provided"},
                      uniqueness: true,
                      length: {minimum: 5}

  def favourited_by?(user)
      favourites.where(user: user).present?
  end

  def favourite_for(user)
      favourites.find_by_user_id(user)
  end
end
