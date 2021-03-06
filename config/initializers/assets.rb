# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are
# already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w(plugin/pace/pace.js)
Rails.application.config.assets.precompile += Ckeditor.assets
Rails.application.config.assets.precompile += %w(ckeditor/*)
Rails.application.config.assets.precompile +=
  %w(plugin/flot/jquery.flot.cust.js)
Rails.application.config.assets.precompile +=
  %w(plugin/flot/jquery.flot.resize.js)
Rails.application.config.assets.precompile +=
  %w(plugin/flot/jquery.flot.tooltip.min.js)
Rails.application.config.assets.precompile += %w( demo.js )
Rails.application.config.assets.precompile += %w( jquery.orgchart.css )
Rails.application.config.assets.precompile += %w( orgchartuno.css )
Rails.application.config.assets.precompile += %w( orgchartdos.css )
Rails.application.config.assets.precompile += %w( jquery.orgchart.js )
Rails.application.config.assets.precompile += %w( scriptschart.js )
