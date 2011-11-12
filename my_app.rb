require 'sinatra'
require 'slim'

configure :development do
  Slim::Engine.set_default_options :pretty => true
end

helpers do
  # add your helpers here
end

get '/' do
  slim :index
end
