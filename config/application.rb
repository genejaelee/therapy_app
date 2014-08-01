require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module TherapyApp
  class Application < Rails::Application
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.serve_static_assets = true
    config.autoload_paths += %W[#{config.root}/lib/validators/]
    
    ENV.update YAML.load_file('config/application.yml')[Rails.env] rescue {}
    
    if !Rails.env.development?
      config.middleware.use Rack::SslEnforcer, :except_hosts => 'therapy.scouterapp.com', :strict => true
    end
    
    config.time_zone = 'Pacific Time (US & Canada)'
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
