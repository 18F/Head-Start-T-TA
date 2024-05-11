source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.6"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.2"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.2"
gem "auto_strip_attributes", "~> 2.5"
gem "activeadmin", "~> 2.6"

gem "omniauth", "~> 1.9"
gem "omniauth-oauth2", "~> 1.7"
gem "omniauth-rails_csrf_protection", "~> 0.1"

# Use Puma as the app server
gem "puma", "~> 4.3"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 5.0"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
gem "kaminari", "~> 1.1"
gem "chewy", "~> 5.1"
gem "cf-app-utils", "~> 0.6", github: "rahearn/cf-app-utils-ruby", branch: "survive-missing-env"
gem "acts-as-taggable-on", "~> 6.5"
gem "kramdown", "~> 2.3"
gem "ffaker", "~> 2.13"
gem "jsonapi-serializers", "~> 1.0"
gem "apitome", "~> 0.3"
gem "json_api_client", "~> 1.17"
gem "smartsheet", "~> 2.101"
gem "creek", "~> 2.5"
gem "chartkick", "~> 3.4"
gem "faraday", "~> 1.0"

gem "pundit", "~> 2.1"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "standard", "~> 0.1"
  gem "brakeman", "~> 4.8"
  gem "bundler-audit", "~> 0.6"
  gem "rspec-rails", "~> 4.0"
  gem "shoulda", "~> 4.0"
  gem "factory_bot_rails", "~> 6.0"
  gem "rspec_api_documentation", "~> 6.1"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "rspec_junit_formatter", "~> 0.4"
  gem "vcr", "~> 6.0"
end
