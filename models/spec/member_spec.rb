require('minitest/autorun')
require('minitest/rg')
require_relative('../member')

class MemberTest < MiniTest::Test

def setup()
  @member = Member.new({'first_name' => 'Kaspars', 'last_name' => 'Dzerins'})
end

  def test_full_name
    assert_equal('Kaspars Dzerins', @member.full_name)
  end

end
