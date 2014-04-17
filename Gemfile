source 'https://rubygems.org'
ruby '2.0.0'
#ruby-gemset=railstutorial_rails_4_0

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'
gem 'pg', '0.15.1'
gem 'figaro'
gem 'retina_rails', '~> 2.0.0'

# Use unicorn as the app server
gem 'unicorn'
gem 'rack-timeout'

group :assets do
  gem 'sass', require: 'sass'
  gem 'sass-rails', '~> 4.0.1'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'bootstrap-sass', '2.3.2.0'
end

group :development, :test do
  gem 'rspec-rails', '2.13.1'
  gem 'factory_girl_rails', '4.2.1'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
end

group :production do
  gem 'rails_12factor'
end

# For scraping
gem 'nokogiri', '1.6.1'
gem 'mechanize', '~> 2.7.2'
gem 'socksify'

# SSL
gem 'rack-ssl-enforcer'

#calendar
gem 'fullcalendar-rails'

gem 'datetimepicker-rails', :require => 'datetimepicker-rails', :git => 'git://github.com/zpaulovics/datetimepicker-rails.git'

#zipcode validation
gem 'zip-code-info'

gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'paperclip', '~> 3.5.1'
gem 'aws-sdk'

gem 'sprockets', '~> 2.11.0'

gem 'attr_encryptor'

gem 'devise', '>= 2.1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
