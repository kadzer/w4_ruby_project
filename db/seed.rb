require('pry-byebug')
require_relative('../models/member')
require_relative('../models/gymclass')
require_relative('../models/instructor')
require_relative('../models/session')

member1 = Member.new({'first_name' => 'Kaspars', 'last_name' => 'Dzerins', 'membership_type' => "basic"})
member1.save()
member2 = Member.new({'first_name' => 'Tanny', 'last_name' => 'Qureshi', 'membership_type' => "premium"})
member2.save()
gymclass1 = GymClass.new({'name' => 'Yoga', 'description' => 'Bend it like Beckham'})
gymclass1.save()
gymclass2 = GymClass.new({'name' => 'Bodybuilding 101', 'description' => 'Lift with me if you wanna live!'})
gymclass2.save()

instructor1 = Instructor.new({'first_name' => 'Arnold', 'last_name' => 'Schwarzenegger', 'profile' => "The man. The myth. The legend."})
instructor1.save()
instructor2 = Instructor.new({'first_name' => 'Bikram', 'last_name' => 'Choudhury', 'profile' => "Founder of Bikram Yoga"})
instructor2.save()

binding.pry
nil
