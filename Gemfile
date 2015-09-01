source 'https://rubygems.org'


gem 'rails', '4.2.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt-ruby'
gem 'foundation-rails'
gem 'foundation-icons-sass-rails'

gem 'omniauth-twitter'
gem 'twitter'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 3.0'	
  gem 'capybara', '~>2.4.0'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'factory_girl', '~> 4.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'database_cleaner'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
	gem 'rubycritic', require: false
end

group :test do
  gem 'webmock'
end
