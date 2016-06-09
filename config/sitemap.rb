
SitemapGenerator::Sitemap.default_host = "http://www.doctorloans.io"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
add root_path, :priority => 0.7, :changefreq => 'daily'
add new_apply_path, :priority => 0.7, :changefreq => 'daily'
add new_contact_path, :priority => 0.7, :changefreq => 'daily'
add doctor_path, :priority => 0.7, :changefreq => 'daily'
add other_path, :priority => 0.7, :changefreq => 'daily'
add privacy_index_path, :priority => 0.7, :changefreq => 'daily'
add new_apply_path, :priority => 0.7, :changefreq => 'daily'
add new_contact_path, :priority => 0.7, :changefreq => 'daily'
add new_testimonial_path, :priority => 0.7, :changefreq => 'daily'
add new_user_session_path, :priority => 0.7, :changefreq => 'daily'
end
