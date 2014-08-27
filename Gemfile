source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.1.1' # FIXME: 4.1.2+ breaks app
gem 'sass-rails', github: 'rails/sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'pg'
gem 'postmark-rails'
gem 'coveralls', require: false
gem 'strip_attributes'
gem 'goldiloader' # automatic lazy eager loading
gem 'active_model_serializers', github: 'rails-api/active_model_serializers', branch: '0-8-stable'
gem 'rack-zippy'
gem 'friendly_id'

# CACHE
gem 'rack-cache'
gem 'dalli'
gem 'kgio'
gem 'memcachier'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'devise'

group :production do
  gem 'rails_12factor'
  gem 'thin'
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'faker'
  gem 'rspec-rails', '~> 3.0.1'
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
end

group :test do
  gem 'rake'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end
