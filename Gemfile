source 'https://rubygems.org'

ruby '2.1.2'


gem 'rails', '4.1.1'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'pg'
gem 'foreigner'
gem 'immigrant'
gem 'postmark-rails'



gem 'rails_best_practices'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'devise'
gem 'rack-timeout'



group :production do
  gem 'rails_12factor'
  gem 'unicorn'
  gem 'newrelic_rpm'
end



group :development, :test do
  gem 'faker'
  gem 'rspec-rails', '2.14.2'
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
  gem 'rake', '10.3.2'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end
