class CreateSearches < ActiveRecord::Migration
  def self.up
    create_table :searches do |t|
      t.string :keywords
      t.integer :user_id
      t.string :user_name
      t.string :user_nick
      t.string :user_proff
      t.string :user_adress
      t.string :user_detail
      t.string :post_title
      t.text :post_content
      t.timestamps
    end
  end

  def self.down
    drop_table :searches
  end
end
