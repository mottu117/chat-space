source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.13', '< 0.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
# http://ruby-rails.hatenadiary.com/entry/20140801/1406907000

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'haml-rails', '~> 0.9'
# http://qiita.com/masarufuruya/items/f8e2fe357ebbac0359d6

gem 'font-awesome-rails'
# http://qiita.com/succi0303/items/7f76d53ebe54dab41124

gem 'erb2haml'
# http://qiita.com/m_doi/items/1f01fd2b1a52c2c43f1f

gem 'carrierwave'
# http://qiita.com/syou007/items/98842179e83c03e5f882

gem 'mini_magick'

gem 'dotenv-rails'
#http://qiita.com/dawn_628/items/913bf584297b3f4f386a

gem 'config'
#http://qiita.com/Esfahan/items/fbca4b9a5ed33be0d0b6

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'faker'

  gem 'rails-controller-testing', require: false
  # http://tech.grooves.com/entry/2016/07/01/184458

  gem 'capybara'
    # http://j-caw.co.jp/blog/?p=1388
end

group :development, :test do
  gem 'byebug'
  gem 'pry-byebug'
  gem 'rspec-rails', '~>3.1.0'
  gem 'factory_girl_rails', '~> 4.4.1'
end

group :development, :production do
  gem 'fog'
  # http://qiita.com/ryo-ichikawa/items/a30dc626cba1ec909d57
end
