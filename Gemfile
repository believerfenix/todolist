# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'pg', '~> 1.2.3'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 6.1.4', '>= 6.1.4.6'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.18'
  gem 'rubocop-rails', '~> 2.9', '>= 2.9.1'
end

group :development do
  gem 'fasterer', '~> 0.9', require: false
  gem 'lefthook', '~> 0.7.2'
  gem 'listen', '~> 3.3'
  gem 'pry-rails', '~> 0.3.4'
  gem 'rubocop', '~> 1.11', require: false
  gem 'rubocop-rspec', '~> 2.2', require: false
  gem 'solargraph', '~> 0.40.4'
  gem 'spring', '~> 4'
end

group :test do
  gem 'pry', '~> 0.14.0'
  gem 'rspec', '~> 3.10'
  gem 'simplecov', '~> 0.21.2', require: false
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
