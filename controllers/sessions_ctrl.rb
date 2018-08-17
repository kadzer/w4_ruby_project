require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/session.rb')
require_relative('../models/booking.rb')
require_relative('../models/member.rb')
require_relative('../models/gymclass.rb')

get '/sessions/:id/signup' do
  @session = Session.find_by_id(params['id'].to_i)
  @gymclasses = GymClass.all()
  @members = Member.all()
  erb(:"sessions/signup")
end

get '/sessions/:id' do
  @session = Session.find_by_id(params['id'].to_i)
  @gymclasses = GymClass.all()
  @members = Member.all()
  erb(:"sessions/view")
end

get '/sessions' do
  @sessions = Session.all()
  erb(:"sessions/index")
end

get '/new/session' do
  @members = Member.all()
  @gymclasses = GymClass.all()
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
  redirect('/sessions')
end

post '/sessions/:id/delete' do
  @session = Session.new(params)
  @session.delete()
  redirect('/sessions')
end

post '/sessions/:id/signup' do
  redirect('/sessions')
end
