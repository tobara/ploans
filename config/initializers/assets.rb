# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( grid.js )
Rails.application.config.assets.precompile += %w( modernizr.custom )
Rails.application.config.assets.precompile += %w( default.css )
Rails.application.config.assets.precompile += %w( component.css )
Rails.application.config.assets.precompile += %w( mbr-additional.css )
Rails.application.config.assets.precompile += %w( mbr-style.css )
Rails.application.config.assets.precompile += %w( mbr-bootstrap.min.css )
Rails.application.config.assets.precompile += %w( SmoothScroll.js )
Rails.application.config.assets.precompile += %w( mbr-script.js )
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( mbr-bootstrap.min.js )
Rails.application.config.assets.precompile += %w( bootstrap-responsive.css )
Rails.application.config.assets.precompile += %w( grid.css )
Rails.application.config.assets.precompile += %w( foot.css )
Rails.application.config.assets.precompile += %w( analytics.js )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
