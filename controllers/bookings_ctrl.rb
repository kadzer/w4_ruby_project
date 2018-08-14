require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/booking.rb')
require_relative('../models/member.rb')
require_relative('../models/gymclass.rb')

get '/bookings' do
  @bookings = Booking.all()
  erb(:"bookings/index")
end

get '/bookings/:id' do
  @booking = Booking.find_by_id(params['id'].to_i)
  @gymclasses = GymClass.all()
  erb(:"bookings/view")
end

get '/new/booking' do
  @members = Member.all()
  @gymclasses = GymClass.all()
  erb(:"bookings/new")
end

post '/new/booking' do
  @booking = Booking.new(params)
  @booking.save()
  redirect('/bookings')
end

post '/bookings/:id/update' do
  @booking = Booking.new(params)
  @booking.update()
  redirect('/bookings')
end

post '/bookings/:id/delete' do
  @booking = Booking.new(params)
  @booking.delete()
  redirect('/bookings')
end
