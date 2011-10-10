# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
   
   
   attr_accessor :password
   attr_accessible :name, :email, :password, :password_confirmation
   attr_accessible :point, :nick, :detail, :adress, :proff, :skill, :photo, :message

   has_attached_file :photo, :styles => { :small => ["250x250>", :png, :jpg, :jpeg] },
                  :url  => "/assets/users/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"

   validates_attachment_presence :photo
   validates_attachment_size :photo, :less_than => 5.megabytes
   validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg']

   
   has_many :comments, :dependent => :destroy
   has_many :microposts, :dependent => :destroy
   has_many :posts, :dependent => :destroy
   has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy
  # has_many :comments, :dependent => :destroy                        
   has_many :following, :through => :relationships, :source => :followed

   has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
   has_many :followers, :through => :reverse_relationships, :source => :follower

   email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   
   
   
   validates :point, :presence => true
                   #  :inclusion => %w( true false )
                     
   validates :nick, :presence => true
   
   
   validates :name,  :presence => true,
                     :length   => { :maximum => 50 }
   validates :email, :presence   => true,
                     :format     => { :with => email_regex },
                     :uniqueness => { :case_sensitive => false }
   # Автоматически создает виртуальный атрибут 'password_confirmation'.
   validates :password, :presence     => true,
                        :confirmation => true,
                        :length       => { :within => 6..40 }
   before_save :encrypt_password
before_create { generate_token(:auth_token) }

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.base64
  end while User.exists?(column => self[column])
end
   
	   def self.search(search)
	   if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	   else
	    find(:all)
	  end
	end
  
 

  def feed
    Micropost.from_users_followed_by(self)
  end

   def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

   def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, stored_salt)
    user = find_by_id(id)
    (user && user.salt == stored_salt) ? user : nil
  end

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end
  
  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end

  private

    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
