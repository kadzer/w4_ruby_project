require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/instructor.rb')

get '/instructors' do
  @instructors = Instructor.all()
  erb(:"instructors/index")
end

get '/instructors/:id' do
  @instructor = Instructor.find_by_id(params['id'].to_i)
  erb(:"instructors/view")
end

get '/new/instructor' do
  erb(:"instructors/new")
end

post '/new/instructor' do
  @instructor = Instructor.new(params)
  @instructor.save()
  redirect('/instructors')
end

post '/instructors/:id/update' do
  @instructor = Instructor.new(params)
  @instructor.update()
  redirect('/instructors')
end

post '/instructors/:id/delete' do
  @instructor = Instructor.new(params)
  @instructor.delete()
  redirect('/instructors')
end
