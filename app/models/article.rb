class Article < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :article_route, presence: true
  validates :img_path, presence: true

end
