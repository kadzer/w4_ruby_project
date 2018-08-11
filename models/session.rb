require_relative('../db/sql_runner')

class Session
  attr_reader :id, :gym_class_id, :instructor_id, :member_id
  attr_accessor :session_time, :capacity

  def initialize (options)
    @id = options['id'].to_i() if options['id']
    @session_time = options['session_time']
    @gym_class_id = options['gym_class_id']
    @instructor_id = options['instructor_id']
    @member_id = options['member_id']
    @capacity = options['capacity']
  end

  def save()
    sql = "INSERT INTO sessions (session_time, gym_class_id, instructor_id, member_id, capacity)
    VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@session_time, @gym_class_id, @instructor_id, @member_id, @capacity]
    session = SqlRunner.run(sql, values).first
    @id = session['id'].to_i()
  end

  def update()
    sql = "UPDATE sessions SET (session_time, gym_class_id, instructor_id, member_id, capacity) = ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@session_time, @gym_class_id, @instructor_id, @member_id, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM sessions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def find_class_information()
    sql = "SELECT description FROM classes WHERE id = $1"
    values = [@gym_class_id]
    return SqlRunner.run(sql, values).first['description']
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
