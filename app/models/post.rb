class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favouriting_users, through: :favourites, source: :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :assetfiles, dependent: :destroy
  # accepts_nested_attributes_for :assetfiles, allow_destroy: true
  validates :title, presence: {message: "must be provided"},
                      uniqueness: true,
                      length: {minimum: 5}
  # validates :favouritecount, numericality: {greater_than_or_equal_to: 0}
  validates :body, uniqueness: {scope: :title}
  before_validation :capitalize
  # include adds module methods as instance methods
  # extend adds module methods as class methods
  extend FriendlyId
  friendly_id :title, use: [:slugged,:history]
  mount_uploader :assetfile, AssetfileUploader

  def self.search(term)
      where(["body ILIKE ? OR title ILIKE ?", "%#{term}%", "%#{term}%"])
  end

  def favourited_by?(user)
      favourites.where(user: user).present?
  end

  def favourite_for(user)
      favourites.find_by_user_id(user)
  end

  private

  def capitalize
    self.title.capitalize!
  end

end
