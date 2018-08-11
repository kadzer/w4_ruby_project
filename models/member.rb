require_relative('../db/sql_runner')

class Member
  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize (options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO members (first_name, last_name)
    VALUES ($1, $2) RETURNING id"
    values = [@first_name, @last_name]
    member = SqlRunner.run(sql, values).first
    @id = member['id'].to_i()
  end

end
