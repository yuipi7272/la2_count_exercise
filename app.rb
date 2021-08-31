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
  count = Count.find(1)
  @number = count.number
  @title = count.title
  
  count = Count.find(2)
  @number2 = count.number
  @title2 = count.title
  erb :index
end

post '/title' do
  count = Count.find(1)
  count.title = params[:title]
  count.save
  redirect '/'
end

post '/plus' do
  count = Count.find(1)
  count.number += 1
  count.save
  redirect '/'
end

post '/minus' do
  count = Count.find(1)
  count.number -= 1
  count.save
  redirect '/'
end

post '/double' do
  count = Count.find(1)
  count.number *= 2
  count.save
  redirect '/'
end

post '/divide' do
  count = Count.find(1)
  count.number /= 2
  count.save
  redirect '/'
end

post '/clear' do
  count = Count.find(1)
  count.number = 0
  count.save
  redirect '/'
end

post '/plus2' do
  count = Count.find(2)
  count.number += 1
  count.save
  redirect '/'
end

post '/minus2' do
  count = Count.find(2)
  count.number -= 1
  count.save
  redirect '/'
end

post '/double2' do
  count = Count.find(2)
  count.number *= 2
  count.save
  redirect '/'
end

post '/divide2' do
  count = Count.find(2)
  count.number /= 2
  count.save
  redirect '/'
end

post '/clear2' do
  count = Count.find(2)
  count.number = 0
  count.save
  redirect '/'
end
