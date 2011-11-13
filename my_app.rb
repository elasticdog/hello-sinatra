require 'sinatra'
require 'slim'
require 'compass'

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = File.join( 'views', 'stylesheets' )
  end

  set :scss, Compass.sass_engine_options
end

configure :development do
  Slim::Engine.set_default_options :pretty => true
end

helpers do
  # add your helpers here
end

get '/' do
  slim :index
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :"stylesheets/#{params[:name]}"
end
