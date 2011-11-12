require_relative '../my_app'
gem 'minitest'
require 'minitest/autorun'
require 'rack/test'

set :environment, :test

describe 'My App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'should say hello' do
    get '/'
    assert last_response.ok?
    last_response.body.must_include 'Hello world!'
  end
end
