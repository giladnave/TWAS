source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'therubyracer', require: "v8"

gem "devise", "~> 2.0.2"
gem "nifty-generators", :group => :development

gem 'hirb'
gem 'haml'

#gem "delayed_job", '2.1.2'
gem "delayed_job",  :git => 'git://github.com/collectiveidea/delayed_job.git'
gem "delayed_job_active_record"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem 'letter_opener'
end

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end
gem "mocha", :group => :test
