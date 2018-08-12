require('minitest/autorun')
require('minitest/rg')
require_relative('../models/session')

class SessionTest < MiniTest::Test

def setup()
  @session = Session.new({ 'session_time' => '10:00:00', 'gym_class_id' => 1, 'instructor_id' => 1 , 'member_id' => 1, 'capacity' => 10 })
end

  def test_description
    assert_equal('Bend it like Beckham', @session.find_class_information())
  end

end
