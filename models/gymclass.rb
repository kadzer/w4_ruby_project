require_relative('../db/sql_runner')

class GymClass
  attr_reader :id
  attr_accessor :name, :description

  def initialize (options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @description = options['description']
  end

  def save()
    sql = "INSERT INTO classes (name, description)
    VALUES ($1, $2) RETURNING id"
    values = [@name, @description]
    gymclass = SqlRunner.run(sql, values).first
    @id = gymclass['id'].to_i()
  end

  def update()
    sql = "UPDATE classes SET (name, description) = ($1, $2)
    WHERE id = $3"
    values = [@name, @description, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM classes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM classes WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    gymclass = GymClass.new(result)
    return gymclass
  end

  def self.all()
    sql = "SELECT * FROM classes"
    gymclasses = SqlRunner.run(sql)
    return gymclasses.map { |gymclass| GymClass.new(gymclass) }
  end

end
