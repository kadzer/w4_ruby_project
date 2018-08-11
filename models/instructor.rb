require_relative('../db/sql_runner')

class Instructor
  attr_reader :id
  attr_accessor :first_name, :last_name, :profile

  def initialize (options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @profile = options['profile']
  end

  def save()
    sql = "INSERT INTO instructors (first_name, last_name, profile)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@first_name, @last_name, @profile]
    instructor = SqlRunner.run(sql, values).first
    @id = instructor['id'].to_i()
  end

  def full_name()
    return "#{first_name} #{last_name}"
  end

  def update()
    sql = "UPDATE instructors SET (first_name, last_name, profile) = ($1, $2, $3)
    WHERE id = $4"
    values = [@first_name, @last_name, @profile, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM instructors WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM instructors WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    instructor = Instructor.new(result)
    return instructor
  end

  def self.all()
    sql = "SELECT * FROM instructors"
    instructors = SqlRunner.run(sql)
    return instructors.map { |instructor| Instructor.new(instructor) }
  end

end
