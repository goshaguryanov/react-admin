source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "redis", "~> 4.0"
gem "sidekiq"
gem "sidekiq-status"
gem "devise"
gem "activeadmin"
gem "webpacker"
gem "react-rails", "~> 2.6"
gem "cancancan"
gem "draper"
gem "filterrific"
gem "will_paginate"
gem "active_model_serializers"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
group :development, :test do
  gem "pry-rails"
  gem "pry-byebug"

  gem "guard", require: false
  gem "guard-rspec", require: false
  gem "guard-bundler", require: false
  gem "guard-rubocop"
  gem "guard-migrate"

  gem "rspec-rails", "~> 3.8"
  gem "factory_bot_rails", '~> 5'
  gem "shoulda-matchers"
  gem "test-prof"
  gem "database_cleaner-active_record"
end

group :development do
  gem "web-console"
  gem "better_errors"
  gem "binding_of_caller"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
