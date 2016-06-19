class AddParaPreviewToArticles < ActiveRecord::Migration
   def up
    add_column :articles, :para_preview, :text, null: false, default: "insert first paragraph"
  end

  def down
    remove_column :articles, :para_preview, :text, null: false
  end
end

