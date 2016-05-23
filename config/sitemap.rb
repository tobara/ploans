# Set the host name for URL creation
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
  Apply.find_each do |apply|
    add apply_path(apply), :lastmod => apply.updated_at
  end
  Contact.find_each do |contact|
    add contact_path(contact), :lastmod => contact.updated_at
  end
  Loan.find_each do |loan|
    add loan_path(loan), :lastmod => loan.updated_at
  end
  Testimonial.find_each do |testimonial|
    add testimonial_path(testimonial), :lastmod => testimonial.updated_at
  end
end
