require('pry-byebug')
require_relative('../models/member')
require_relative('../models/gym_class')
require_relative('../models/instructor')
require_relative('../models/session')

member1 = Member.new({'first_name' => 'Kaspars', 'last_name' => 'Dzerins', 'membership_type' => "basic"})
member1.save()

member2 = Member.new({'first_name' => 'Tanny', 'last_name' => 'Qureshi', 'membership_type' => "premium"})
member2.save()

binding.pry
nil
