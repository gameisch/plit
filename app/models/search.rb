class Search < ActiveRecord::Base
  attr_accessible :keywords, :user_id, :user_name, :user_nick, :user_proff, :user_adress, :user_detail, :post_title, :post_content
  
def users
  @users ||= find_users
end

def posts
  @posts ||= find_posts
end

private

def find_posts
  Post.find(:all, :conditions => conditions)
end

def find_users
  User.find(:all, :conditions => conditions)
end

def keyword_conditions
  ["users.name LIKE ?", "%#{keywords}%"] unless keywords.blank?
end

def keyword_user_nick_conditions
  ["users.nick LIKE ?", "%#{keywords}%"] unless keywords.blank?
end

def keyword_user_proff_conditions
  ["users.proff LIKE ?", "%#{keywords}%"] unless keywords.blank?
end

def keyword_user_detail_conditions
  ["users.detail LIKE ?", "%#{keywords}%"] unless keywords.blank?
end

def keyword_user_adress_conditions
  ["users.adress LIKE ?", "%#{keywords}%"] unless keywords.blank?
end



#def minimum_price_conditions
 # ["products.price >= ?", minimum_price] unless minimum_price.blank?
#end

#def maximum_price_conditions
  #["products.price <= ?", maximum_price] unless maximum_price.blank?
#end


def user_name_conditions
  ["Users.name = ?", user_name] unless user_name.blank?
end

def user_nick_conditions
  ["Users.nick = ?", user_nick] unless user_nick.blank?
end

def user_proff_conditions
  ["Users.proff = ?", user_proff] unless user_proff.blank?
end

def user_detail_conditions
  ["Users.detail = ?", user_proff] unless user_detail.blank?
end

def user_adress_conditions
  ["Users.adress = ?", user_adress] unless user_adress.blank?
end

#def user_proff_conditions
#  ["Users.proff = ?", user_proff] unless user_proff.blank?
#end


def conditions
  [conditions_clauses.join(' AND '), *conditions_options]
end

def conditions_clauses
  conditions_parts.map { |condition| condition.first }
end

def conditions_options
  conditions_parts.map { |condition| condition[1..-1] }.flatten
end

def conditions_parts
  private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
end

end
