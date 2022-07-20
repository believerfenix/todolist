# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'active_storage_validations', '~> 0.9.5'
gem 'acts_as_list', '~> 1.0', '>= 1.0.4'
gem 'bcrypt', '~> 3.1', '>= 3.1.16'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'jsonapi-serializer', '~> 2.2'
gem 'jwt_sessions', '~> 2.6'
gem 'pg', '~> 1.2.3'
gem 'puma', '~> 5.0'
gem 'pundit', '~> 2.1'
gem 'rack-cors', '~> 1.1', '>= 1.1.1'
gem 'rails', '~> 6.1.4', '>= 6.1.4.6'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.18'
  gem 'rspec-rails', '~> 5.0.0'
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
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  gem 'dox', '~> 2.1', require: false
  gem 'json_matchers', '~> 0.11.1'
  gem 'pry', '~> 0.14.0'
  gem 'pundit-matchers', '~> 1.7'
  gem 'rspec', '~> 3.10'
  gem 'shoulda-matchers', '~> 4.5', '>= 4.5.1'
  gem 'simplecov', '~> 0.21.2', require: false
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
