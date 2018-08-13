require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/gymclass.rb')

get '/classes' do
  @gymclass = GymClass.all()
  erb(:"classes/index")
end

get '/classes/:id' do
  @gymclass = GymClass.find_by_id(params['id'].to_i)
  erb(:"classes/view")
end

get '/new/class' do
  erb(:"classes/new")
end

post '/new/class' do
  @gymclass = GymClass.new(params)
  @gymclass.save()
  redirect('/classes')
end

post '/classes/:id/update' do
  @gymclass = GymClass.new(params)
  @gymclass.update()
  redirect('/classes')
end

post '/classes/:id/delete' do
  @gymclass = GymClass.new(params)
  @gymclass.delete()
  redirect('/classes')
end
