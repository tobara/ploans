class AddArticleDateToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :article_date, :string, null: false, default: "June 16, 2016 at 7:00 PM"
  end

  def self.down
    remove_column :articles, :article_date, :string, null: false
  end

end
