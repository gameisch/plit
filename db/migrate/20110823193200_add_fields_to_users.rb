class AddFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :point, :string
    add_column :users, :adress, :string
    add_column :users, :detail, :string
    add_column :users, :skill, :string
    add_column :users, :proff, :string
    add_column :users, :nick, :string
  end

  def self.down
    drop_table :users, :nick
    drop_table :users, :proff
    drop_table :users, :skill
    drop_table :users, :detail
    drop_table :users, :adress
    drop_table :users, :point
  end
end
