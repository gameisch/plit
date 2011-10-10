class Post < ActiveRecord::Base
attr_accessible :content, :title, :image

belongs_to :user
has_many :comments
has_attached_file :image, :styles => { :small => "250x250>" },
                  :url  => "/post_assets/users/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/post_assets/users/:id/:style/:basename.:extension"

validates_attachment_presence :image
validates_attachment_size :image, :less_than => 5.megabytes
validates_attachment_content_type :image, :content_type => ['image/jpeg', 'iamge/jpg', 'image/png']

  validates :title,   :presence => true
  validates :content, :presence => true
  validates :user_id, :presence => true

default_scope :order => 'posts.created_at DESC'

  def feed
    Post.from_users_followed_by(self)
  end
  
  def self.from_users_followed_by(user)
    where(:user_id => user.following.push(user))
  end

  

  # Return microposts from the users being followed by the given user.
  scope :from_users_followed_by, lambda { |user| followed_by(user) }

  private

    # Return an SQL condition for users followed by the given user.
    # We include the user's own id as well.
    def self.followed_by(user)
      following_ids = %(SELECT followed_id FROM relationships
                        WHERE follower_id = :user_id)
      where("user_id IN (#{following_ids}) OR user_id = :user_id",
            { :user_id => user })
    end
end


