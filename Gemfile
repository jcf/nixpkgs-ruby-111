source 'https://rubygems.org'

ruby file: '.ruby-version'

gem 'rails', '7.1.3'

gem 'config', '~> 4.2', '>= 4.2.1'
gem 'draper', '~> 4.0'
gem 'importmap-rails', '~> 1.2'
gem 'kaminari', '~> 1.2', '>= 1.2.2'
gem 'oj', '~> 3.16.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 6.4.2'
gem 'sprockets-rails', '~> 3.4'
gem 'stimulus-rails', '~> 1.2'
gem 'turbo-rails', '~> 1.4'

gem 'bootsnap', '~> 1.16', require: false

group :development do
  gem 'web-console', '~> 4.2'

  # Command-line tools that shouldn't be required when loading the application
  # environment.
  gem 'brakeman', '~> 6.0', require: false
  gem 'bundler-audit', '~> 0.9', require: false
  gem 'rubocop', '~> 1.56', require: false
  gem 'rubocop-capybara', '~> 2.18', require: false
  gem 'rubocop-performance', '~> 1.19', require: false
  gem 'rubocop-rails', '~> 2.21', require: false
  gem 'rubocop-rspec', '~> 2.24', require: false
  gem 'ruby-lsp', '~> 0.10', require: false
  gem 'ruby-lsp-rails', '~> 0.2', require: false
end

group :development, :test do
  gem 'factory_bot', '~> 6.4'
  gem 'factory_bot_rails', '~> 6.4'
  gem 'faker', '~> 3.2'
  gem 'rspec-mocks', '~> 3.12.6'
  gem 'rspec-rails', '~> 6.0.0'
end

group :test do
  gem 'capybara', '~> 3.39'
  gem 'selenium-webdriver', '~> 4.12'
end
