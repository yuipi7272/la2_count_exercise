require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
  if Count.count == 0
    Count.create(number: 0)
    Count.create(number: 0)
  end
end

get '/' do
  @counts = Count.all.order("created_at desc")
  erb :index
end

post '/create' do 
  Count.create(number: 0, title: params[:title])
  redirect '/'
end
post '/plus/:id' do
  count = Count.find(params[:id])
  count.number += 1
  count.save
  redirect '/'
end

post '/minus/:id' do
  count = Count.find(params[:id])
  count.number -= 1
  count.save
  redirect '/'
end

post '/double/:id' do
  count = Count.find(params[:id])
  count.number *= 2
  count.save
  redirect '/'
end

post '/divide/:id' do
  count = Count.find(params[:id])
  count.number /= 2
  count.save
  redirect '/'
end

post '/clear/:id' do
  count = Count.find(params[:id])
  count.number = 0
  count.save
  redirect '/'
end
