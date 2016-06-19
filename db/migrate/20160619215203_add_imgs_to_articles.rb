class AddImgsToArticles < ActiveRecord::Migration
  def up
    add_column :articles, :landing_img_path, :string, null: false, default: "add_landing_image_path"
  end
  def down
    remove_column :articles, :landing_img_path, :string, null: false
  end
end
