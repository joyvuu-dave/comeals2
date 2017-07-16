source 'https://rubygems.org'

ruby '2.4.1'

gem 'rails', '~> 4.2'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'pg', '0.20'
gem 'postmark-rails'
gem 'coveralls', require: false
gem 'strip_attributes'
gem 'goldiloader' # automatic lazy eager loading
gem 'active_model_serializers', '~> 0.8'
gem 'friendly_id'
gem 'thin'

# CACHE
gem 'rack-cache'
gem 'dalli'
gem 'kgio'
gem 'memcachier'

gem 'activeadmin'
gem 'devise'
gem 'delayed_job_active_record'

group :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'faker'
  gem 'rspec-rails'
end

group :development do
  gem 'spring'
  gem 'annotate'
  gem 'sextant'
  gem 'pry-rails'
  gem 'quiet_assets'

  # PROFILING
  gem 'uniform_notifier', '>=1.5.0' # so we can use quiet option
  gem 'bullet'
  gem 'ruby_gntp' # for growl v1.3+
  gem 'rack-mini-profiler', require: false
  gem 'web-console', '~> 3.0'
end

group :test do
  gem 'rake'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end
