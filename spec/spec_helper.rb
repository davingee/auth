# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

require 'capybara/rails'
require 'capybara/rspec'
include Warden::Test::Helpers
# require "paperclip/matchers"

# # require "test/unit"
# require "mocha/setup"

# require 'capybara/poltergeist'
# Capybara.javascript_driver = :poltergeist

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  # ## Mock Framework
  # config.include SignInHelperSupport, :type => :request
  # config.include Devise::TestHelpers, :type => :controller
  # config.include LoginHelperSupport, :type => :request
  # config.include Omniauth, :type => :request
  # 
  # config.include FactoryGirl::Syntax::Methods
  # config.include Capybara::DSL

  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
  
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    Warden.test_mode!
    DatabaseCleaner.start
  end

  config.after(:each) do
    Warden.test_reset!
    DatabaseCleaner.clean
  end
  
end
