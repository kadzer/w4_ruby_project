require('minitest/autorun')
require('minitest/rg')
require_relative('../session')

class SessionTest < MiniTest::Test

def setup()
  @session = Session.new({'session_date' => '2018-08-15',  'start_time' => '10:15','duration' => 30, 'gym_class_id' => 1, 'instructor' => 'Arnold', 'location' => 'weight section'})
end

  def test_description
    assert_equal("", @session.return_class['name']())
  end

end
