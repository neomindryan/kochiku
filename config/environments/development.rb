Kochiku::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  config.eager_load = false

  # Show full error reports
  config.consider_all_requests_local = true

  # Enable page, action, and fragment caching
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Generate digests for assets URLs
  #config.assets.digest = false

  config.sass.preferred_syntax = :sass
  Rails.application.routes.default_url_options[:host] = "localhost:3000"
  config.action_mailer.default_url_options = {:host => "localhost:3000"}
end
