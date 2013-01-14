ENV['RACK_ENV'] = 'test'

require_relative '../my_app'
require 'minitest/autorun'
require "turn/autorun"
require 'rack/test'

# Include rack helpers and expose full application stack
class MiniTest::Spec
  include Rack::Test::Methods
  
  def app
    Rack::Builder.parse_file(File.dirname(__FILE__) + '/../config.ru').first
  end
end

# Configure test output
# possible values are :pretty, :dot, :cue, :marshal, :outline, :progress
Turn.config.format = :dot