require('minitest/autorun')
require('minitest/rg')
require_relative('../booking')

class BookingTest < MiniTest::Test

def setup()
  @booking = Booking.new({ 'gym_class_id' => 1, 'member_id' => 1 })
end

  def test_return_member
    assert_equal('Kaspars', @booking.return_member['first_name'])
  end

end
