require('minitest/autorun')
require('minitest/rg')
require_relative('../models/instructor')

class InstructorTest < MiniTest::Test

def setup()
  @instructor = Instructor.new({'first_name' => 'Arnold', 'last_name' => 'Schwarzenegger', 'profile' => 'The man. The myth. The legend.'})
end

  def test_full_name
    assert_equal('Arnold Schwarzenegger', @instructor.full_name)
  end

end
