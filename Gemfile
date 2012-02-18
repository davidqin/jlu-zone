source 'http://ruby.taobao.org'

gem 'rails', '3.2.1'

gem 'haml-rails',               '0.3.4'

gem "will_paginate",            '3.0.3'

gem 'twitter-bootstrap-rails',  :git => 'http://github.com/seyhunak/twitter-bootstrap-rails.git'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
  gem 'execjs'

  gem 'therubyracer'
end

gem 'jquery-rails'

group :deployment do
  gem 'mysql',                  '2.8.1'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  gem 'turn',                   '0.9.1', :require => false
end

group :debug do
  gem 'linecache19',            :git => 'git://github.com/robmathews/linecache19-0.5.13.git'

  #curl -OL http://rubyforge.org/frs/download.php/75414/linecache19-0.5.13.gem

  gem 'ruby-debug-base19x',     '0.11.30.pre4'

  gem 'ruby-debug19',           '0.11.6', :require => 'ruby-debug'
end
