class User < ActiveRecord::Base
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourited_posts, through: :favourites, source: :post


  # # we want to set up an association set for posts that have been liked
  # # by the user
  # has_many :likes, dependent: :destroy
  # # In this case we need to use has_many / through with a `source` option
  # # because we already havea `has_many :posts` association above which will
  # # conflict with this association if we just make it
  # # `has_many :question, though: :likes`
  # # has_many(:liked_questions, {through: :likes, source: :question})
  # has_many :liked_questions, through: :likes, source: :question
  #
  # has_many :favourites, dependent: :destroy
  # has_many :favourited_questions, through: :favourites, source: :question
  #
  # has_many :flags, dependent: :destroy
  # has_many :flagged_questions, through: :flags, source: :question
  #
  # has_many :collaborations, dependent: :destroy
  # has_many :collaborated_questions, through: :collaborations, source: :question
  #
  # has_many :votes, dependent: :destroy
  # has_many :voted_questions, through: :votes, source: :question
  #
  # # the object that starts and ends with / is called a regular expression
  # # Regular expressions are used to match string patterns
  validates :email, presence: true, uniqueness: true,
            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}".strip.squeeze(" ")
  end

end
