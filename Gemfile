source 'https://rubygems.org'

gem 'rails', '4.1.1'
gem 'rails-api'
gem 'sqlite3'
gem 'active_model_serializers'
gem 'unicorn'

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
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
end

group :production do
  gem 'rails_12factor'
end

