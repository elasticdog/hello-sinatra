require_relative '../my_app'
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'

set :environment, :test

class MiniTest::Spec
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end
end