class DynamicRouter
  def self.load
    Rails.application.routes.draw do
      Article.all.each do |article|
        puts "Routing #{article.article_route}"
           get "#{article.article_route}" => 'articles#show', :path => "#{article.article_route}", defaults: { id: article.id }
      end
    end
  end

  def self.reload
    Rails.application.routes_reloader.reload!
  end
end
