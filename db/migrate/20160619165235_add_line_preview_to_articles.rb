class AddLinePreviewToArticles < ActiveRecord::Migration
   def up
    add_column :articles, :line_preview, :string, null: false, default: "insert first line"
  end

  def down
    remove_column :articles, :line_preview, :string, null: false
  end
end
