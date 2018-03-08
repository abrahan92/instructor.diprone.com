require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "1cc2ed68e2fbf43a2b540cf5b2f99940fe67f9e25f40b5df831217e53f9c82a9"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
