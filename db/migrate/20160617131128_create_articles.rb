class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :article_route
      t.string :img_path, null: false

      t.timestamps null: false
    end
  end
end
