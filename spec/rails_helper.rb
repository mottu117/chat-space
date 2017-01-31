# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

# 参考記事 http://qiita.com/tetsu8dayo/items/d6a06a13a8ec0fdf8fa6
require 'rails-controller-testing'

# 参考記事 http://j-caw.co.jp/blog/?p=1388
require 'capybara/rspec'
require 'capybara/rails'
include Capybara::DSL

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
  config.include FactoryGirl::Syntax::Methods

  [:controller, :view, :request].each do |type|
    # 参考記事 http://qiita.com/nysalor/items/ef3d658ff76bee165379
    config.include Devise::Test::ControllerHelpers, type: type

    # 参考記事 http://qiita.com/tetsu8dayo/items/d6a06a13a8ec0fdf8fa6
    config.include ::Rails::Controller::Testing::TestProcess, type: type
    config.include ::Rails::Controller::Testing::TemplateAssertions, type: type
    config.include ::Rails::Controller::Testing::Integration, type: type
  end
end
