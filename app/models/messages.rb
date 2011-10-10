class Message < ActiveRecord::Base
  has_ancestry
  belongs_to :user
  
  validates :content, :presence => true, :length => { :maximum => 200 }
  validates :user_id, :presence => true
  
  default_scope :order => 'messages.created_at DESC'
end

