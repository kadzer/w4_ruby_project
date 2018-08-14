require('minitest/autorun')
require('minitest/rg')
require_relative('../models/gymclass')

class GymClassTest < MiniTest::Test

def setup()
  @gymclass = GymClass.new({'name' => 'Yoga', 'instructor' => 'Bikram', 'description' => 'Bend it like Beckham', 'capacity' => 2})
end

  def test_returns_description
    assert_equal('Bend it like Beckham', @gymclass.description())
  end

end
