source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

gem 'omniauth-facebook'
gem 'devise'

# gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem 'carrierwave'
gem "mini_magick"

# Gems used only for assets and not required
# in production environments by default.
gem 'compass-rails'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem "font-awesome-rails"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'


group :test, :development do
  # gem 'debugger'
  gem 'pry-rails'
  gem "sqlite3"
  gem "rspec-rails" #, ">= 2.12.2"
  gem 'awesome_print'
  gem "mocha", :require => false
  gem 'selenium-webdriver'
  # Elsewhere after Bundler has loaded gems
  # gem 'factory_girl'
  # gem 'factory_girl_rails'
  gem "factory_girl_rails", "~> 4.0"
end

group :development do
  # To use debugger
  gem "quiet_assets" #, ">= 1.0.2"
  gem "better_errors" #, ">= 0.7.2"
  gem "html2haml"#, ">= 1.0.1"
  gem 'binding_of_caller'
end

group :test do
  gem "database_cleaner"#, ">= 1.0.0.RC1"
  gem 'launchy'
  gem 'poltergeist'  
  gem "capybara"#, ">= 2.0.3"
  gem "database_cleaner"#, ">= 1.0.0.RC1"
  gem "email_spec"#, ">= 1.4.0"
  gem "machinist"#, ">= 2.0"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
