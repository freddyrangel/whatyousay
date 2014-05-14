source 'https://rubygems.org'

gem 'rails', '4.1.1'
gem 'sqlite3'
gem 'uglifier'
gem 'coffee-rails'
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'pry-rails'
gem 'unicorn'
gem 'fog'

group :development do
  gem 'guard-rspec', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'rb-fsevent'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'foreman'
end

group :test do
  gem 'capybara'
  gem 'simplecov', :require => false
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'shoulda-matchers'
end

group :production do
  gem 'rails_12factor'
end

