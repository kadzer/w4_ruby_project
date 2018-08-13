require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/session.rb')

get '/sessions' do
  @sessions = Session.all()
  erb(:"sessions/index")
end

get '/sessions/:id' do
  @member = Session.find_by_id(params['id'].to_i)
  erb(:"sessions/view")
end

get '/new/session' do
  erb(:"sessions/new")
end

post '/new/session' do
  @session = Session.new(params)
  @session.save()
  redirect('/sessions')
end

post '/sessions/:id/update' do
  @session = Session.new(params)
  @session.update()
  redirect('/members')
end

post '/sessions/:id/delete' do
  @session = Session.new(params)
  @session.delete()
  redirect('/sessions')
end
