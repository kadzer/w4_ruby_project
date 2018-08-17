require_relative('../db/sql_runner')

class Session
  attr_reader :id, :gym_class_id
  attr_accessor :session_date, :start_time, :duration, :instructor, :location, :capacity

  def initialize (options)
    @id = options['id'].to_i() if options['id']
    @session_date = options['session_date']
    @start_time = options['start_time']
    @duration = options['duration']
    @gym_class_id = options['gym_class_id']
    @instructor = options['instructor']
    @location = options['location']
    @capacity = options['capacity']
  end

  def save()
    sql = "INSERT INTO sessions (session_date, start_time, duration,  gym_class_id, instructor, location, capacity)
    VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id"
    values = [@session_date, @start_time, @duration, @gym_class_id, @instructor, @location, @capacity]
    session = SqlRunner.run(sql, values).first
    @id = session['id'].to_i()
  end

  def update()
    sql = "UPDATE sessions SET (session_date, start_time, duration,  gym_class_id, instructor, location, capacity) = ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8"
    values = [@session_date, @start_time, @duration, @gym_class_id, @instructor, @location, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM sessions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def return_class()
    sql = "SELECT * FROM classes WHERE id = $1"
    values = [@gym_class_id]
    return SqlRunner.run(sql, values).first
  end

  def nice_time()
    sql = "SELECT to_char(start_time, 'HH24:MI') FROM sessions WHERE id = $1"
    values = [@id]
    return SqlRunner.run(sql, values).first['to_char']
  end

  def count_bookings()
    sql = "SELECT COUNT (*) FROM bookings WHERE session_id = $1"
    values = [@id]
    return SqlRunner.run(sql, values).first['count']
  end

  def display_members()
    sql = "SELECT members.* FROM members INNER JOIN bookings ON members.id = bookings.member_id WHERE bookings.session_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map{ |member| Member.new(member) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM sessions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    session = Session.new(result)
    return session
  end

  def self.all()
    sql = "SELECT * FROM sessions"
    sessions = SqlRunner.run(sql)
    return sessions.map { |session| Session.new(session) }
  end

end
