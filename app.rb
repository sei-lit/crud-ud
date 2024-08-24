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

get "/item/:id" do
  @id = params[:id]
  @medicine = Medicine.find(params[:id])
  erb:item
end

post "/item/:id" do
  medicine = Medicine.find(params[:id])
  medicine.update(name: params[:name], stock: params[:stock])
  redirect "/"
end

get "/item/:id/delete" do
  medicine = Medicine.find(params[:id])
  medicine.destroy
  redirect "/"
end
