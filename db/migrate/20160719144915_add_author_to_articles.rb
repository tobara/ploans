class AddAuthorToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :author, :string, null: false, default: "Tim O."
  end

  def self.down
    remove_column :articles, :author, :string, null: false
  end
end
