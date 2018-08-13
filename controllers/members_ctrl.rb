require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')

get '/members' do
  @members = Member.all()
  erb(:"members/index")
end

get '/members/:id' do
  @member = Member.find_by_id(params['id'].to_i)
  erb(:"members/view")
end

get '/new/member' do
  erb(:"members/new")
end

post '/new/member' do
  @member = Member.new(params)
  @member.save()
  redirect('/members')
end

post '/members/:id/update' do
  @member = Member.new(params)
  @member.update()
  redirect('/members')
end

post '/members/:id/delete' do
  @member = Member.new(params)
  @member.delete()
  redirect('/members')
end
