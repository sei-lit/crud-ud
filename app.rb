require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models'

get '/' do
  @medicines = Medicine.all
  erb:index
end

get '/medicines/new' do
  erb :new
end

post '/medicines/new' do
  Medicine.create(name: params[:name], stock: params[:stock])
  redirect '/'
end
