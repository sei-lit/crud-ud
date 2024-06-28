require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models'

get '/' do
  @medicines = Medicine.all
  erb:index
end

get '/item/create' do
  erb :new
end

post '/item/create' do
  Medicine.create(name: params[:name], stock: params[:stock])
  redirect '/'
end

get '/item/:id' do
  @item = Medicine.find(params[:item_id])
  erb :item
end

post '/item/:id' do
  item = Medicine.find(params[:item_id])
  item.name = params[:item_name]
  item.stock = params[:item_stock]
  item.save
  redirect "/"
end

get '/item/:id/delete' do
  item = Medicine.find(params[:item_id])
  item.destroy
  redirect "/"
end