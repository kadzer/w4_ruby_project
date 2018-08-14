require('minitest/autorun')
require('minitest/rg')
require_relative('../models/booking')

class BookingTest < MiniTest::Test

def setup()
  @booking = Booking.new({ 'start_time' => '10:00:00', 'gym_class_id' => 1, 'member_id' => 1})
end

  def test_description
    assert_equal('Yoga', @booking.return_class['name']())
  end

end
