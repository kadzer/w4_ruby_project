require('pry-byebug')
require_relative('../models/member')
require_relative('../models/gymclass')
require_relative('../models/booking')
require_relative('../models/session')

member1 = Member.new({'first_name' => 'Kaspars', 'last_name' => 'Dzerins', 'membership_type' => "basic"})
member2 = Member.new({'first_name' => 'Tanny', 'last_name' => 'Qureshi', 'membership_type' => "basic"})
member3 = Member.new({'first_name' => 'Christian', 'last_name' => 'Geib', 'membership_type' => "basic"})
member4 = Member.new({'first_name' => 'Jane', 'last_name' => 'Duncan', 'membership_type' => "premium"})
member5 = Member.new({'first_name' => 'Connie', 'last_name' => 'Leighton', 'membership_type' => "premium"})
member1.save()
member2.save()
member3.save()
member4.save()
member5.save()

gymclass1 = GymClass.new({'name' => 'Yoga', 'description' => 'By perverts, for perverts.'})
gymclass2 = GymClass.new({'name' => 'Lifting 101', 'description' => 'Come with me if you wanna lift!'})
gymclass3 = GymClass.new({'name' => 'Spinning for beginners', 'description' => 'All the sweat minus the distance.'})
gymclass4 = GymClass.new({'name' => 'Boxercise', 'description' => 'For when you want to look tough without the risk of being punched in the face.'})
gymclass1.save()
gymclass2.save()
gymclass3.save()
gymclass4.save()

session1 = Session.new({'session_date' => '2018-08-16', 'start_time' => '08:00', 'duration' => '60',  'gym_class_id' => gymclass2.id, 'instructor' => 'Rainier Wolfcastle', 'location' => 'weight room', 'capacity' => 5})
session1.save()

booking1 = Booking.new({'session_id' => session1.id, 'gym_class_id' => gymclass1.id, 'member_id' => member1.id})
booking2 = Booking.new({'session_id' => session1.id, 'gym_class_id' => gymclass1.id, 'member_id' => member2.id})
booking3 = Booking.new({'session_id' => session1.id, 'gym_class_id' => gymclass1.id, 'member_id' => member3.id})
booking1.save()
booking2.save()
booking3.save()

binding.pry
nil
