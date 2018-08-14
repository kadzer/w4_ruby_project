require_relative('../db/sql_runner')
require_relative('member.rb')

class Booking
  attr_reader :id, :gym_class_id, :member_id
  attr_accessor :start_time, :capacity

  def initialize (options)
    @id = options['id'].to_i() if options['id']
    @start_time = options['start_time']
    @gym_class_id = options['gym_class_id']
    @member_id = options['member_id']
    @capacity = options['capacity']
  end

  def save()
    sql = "INSERT INTO bookings (start_time, gym_class_id, member_id, capacity)
    VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@start_time, @gym_class_id, @member_id, @capacity]
    booking = SqlRunner.run(sql, values).first
    @id = booking['id'].to_i()
  end

  def update()
    sql = "UPDATE bookings SET (start_time, gym_class_id, member_id, capacity) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@start_time, @gym_class_id, @member_id, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def return_class()
    sql = "SELECT * FROM classes WHERE id = $1"
    values = [@gym_class_id]
    return SqlRunner.run(sql, values).first
  end

  def return_member()
    sql = "SELECT * FROM members WHERE id = $1"
    values = [@member_id]
    return SqlRunner.run(sql, values).first
  end

  def list_members()
    sql = "SELECT members.* FROM members
    INNER JOIN bookings ON members.id = bookings.member_id
    WHERE bookings.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    array = result.map{ |member| Member.new(member) }
    return array.map { |member| member.full_name }
  end

def nice_time()
  sql = "SELECT to_char(start_time, 'HH24:MI') FROM bookings WHERE id = $1"
  values = [@id]
  return SqlRunner.run(sql, values).first['to_char']
end

  def self.count_enrolled_members(id)
    sql = "SELECT COUNT(*) FROM bookings WHERE member_id = $1"
    values = [id]
    return SqlRunner.run(sql, values).first['count']
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM bookings WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    booking = Booking.new(result)
    return booking
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    bookings = SqlRunner.run(sql)
    return bookings.map { |booking| Booking.new(booking) }
  end

end
