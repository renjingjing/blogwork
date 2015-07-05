class Comment < ActiveRecord::Base
  belongs_to :post
  validates :body, presence: true, uniqueness: true
  paginates_per 50
end
