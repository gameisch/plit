class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :comments
  
  
  validates :body,   :presence => true
  validates :post, :presence => true
  validates :user_id, :presence => true
end
