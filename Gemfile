source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bootsnap", require: false
gem "importmap-rails"
gem "mysql2"
gem "puma"
gem "rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "rails-i18n"

gem "hashids"

gem "devise"
gem "devise-i18n"
gem "omniauth-google-oauth2"
gem "omniauth-rails_csrf_protection"
gem "pundit"
gem "rolify"

gem "kaminari"
gem "kaminari-i18n"

gem "enumerize"
gem "meta-tags"
gem "simple_form"

gem "activerecord-import"

gem "faraday"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]

  gem "annotate", require: false

  gem "erb_lint", require: false
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false

  gem "shoulda-matchers"

  gem "brakeman", require: false
  gem "rails_best_practices", require: false

  gem "bullet"
  gem "factory_bot_rails"
  gem "rspec-rails"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers", require: false

  gem "faker"
end
