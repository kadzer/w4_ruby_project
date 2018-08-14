require('pry-byebug')
require_relative('../models/member')
require_relative('../models/gymclass')
require_relative('../models/booking')

member1 = Member.new({'first_name' => 'Kaspars', 'last_name' => 'Dzerins', 'membership_type' => "basic"})
member1.save()
member2 = Member.new({'first_name' => 'Tanny', 'last_name' => 'Qureshi', 'membership_type' => "premium"})
member2.save()

gymclass1 = GymClass.new({'name' => 'Yoga', 'instructor' => 'Bikram', 'description' => 'Bend it like Beckham'})
gymclass1.save()
gymclass2 = GymClass.new({'name' => 'Bodybuilding 101', 'instructor' => 'Arnold', 'description' => 'Come with me if you wanna lift!'})
gymclass2.save()

booking1 = Booking.new({'start_time' => "10:00:00", 'gym_class_id' => gymclass1.id, 'member_id' => member1.id, 'capacity' => 10})
booking1.save()
booking2 = Booking.new({'start_time' => "11:00:00", 'gym_class_id' => gymclass2.id, 'member_id' => member2.id, 'capacity' => 10})
booking2.save()

binding.pry
nil
