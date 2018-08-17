require_relative('../db/sql_runner')

class Booking
  attr_reader :id, :session_id, :member_id

  def initialize (options)
    @id = options['id'].to_i() if options['id']
    @session_id = options['session_id']
    @member_id = options['member_id']
  end

  def save()
    sql = "INSERT INTO bookings (session_id, member_id)
    VALUES ($1, $2) RETURNING id"
    values = [@session_id, @member_id]
    booking = SqlRunner.run(sql, values).first
    @id = booking['id'].to_i()
  end

  def update()
    sql = "UPDATE bookings SET (session_id, member_id) = ($1, $2)
    WHERE id = $3"
    values = [@session_id, @member_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def return_session()
    sql = "SELECT * FROM sessions WHERE id = $1"
    values = [@session_id]
    return SqlRunner.run(sql, values).first
  end

  def return_member()
    sql = "SELECT * FROM members WHERE id = $1"
    values = [@member_id]
    return SqlRunner.run(sql, values).first
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
