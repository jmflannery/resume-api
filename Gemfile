source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.0.2'

gem 'pg'
gem 'rack-cors'
gem 'toke', git: 'https://github.com/jmflannery/toke.git', branch: 'master'
gem 'rez', git: 'https://github.com/jmflannery/rez.git', branch: 'master'

gem 'puma'

group :doc do
  # Deploy with Capistrano
  gem 'capistrano', '~> 3.2', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-chruby',  require: false
  gem 'capistrano3-puma',   require: false
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use debugger
# gem 'debugger', group: [:development, :test]
