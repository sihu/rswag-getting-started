# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(File.join(__dir__, '.ruby-version'))

gem 'importmap-rails'
gem 'jbuilder'
gem 'puma', '~> 5.0'
gem 'pg'
gem 'figaro'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'rubocop'
gem 'devise'
gem 'devise-jwt'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'timecop'
gem 'rack-cors'
gem 'bootsnap', require: false
gem 'renuocop', require: false

gem 'rswag-api'
gem 'rswag-ui'

group :development, :test do
  gem 'rswag-specs'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 6.0.0'
end

group :development do
  gem 'web-console'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
