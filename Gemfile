source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer'
end

gem 'jquery-rails'
gem 'bootstrap-sass', '>= 2.3.0.0'
gem 'carrierwave', :git => 'git@github.com:morshedalam/carrierwave.git'
gem 'haml-rails'
gem 'simple_form'
gem 'jquery-fileupload-rails', '0.4.0'
gem 'fog'

group :development do
  gem 'brakeman'
  gem 'rename'
  gem 'rb-readline'
  gem 'annotate'
end

# Gems for development and test
group :development, :test do
  gem 'spork'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '1.0.1'
  gem 'rspec-rails'
end

group :test do
  gem 'webrat'
  gem 'cucumber-rails', :require => false
  gem 'pickle', '~> 0.4.4'
end