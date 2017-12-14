require_relative("../db/sql_runner")
require("pry-byebug")

class Student

  attr_reader :id, :first_name, :last_name, :house_id, :age

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @house_id = options["house_id"].to_i
    @age = options["age"].to_i
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, house_id, age)
    VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@first_name, @last_name, @house_id, @age]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def house()
    sql = "SELECT * FROM houses
          WHERE id = $1"
    values = [@house_id]
    result = SqlRunner.run(sql, values)
    house_hash = result.first
    # binding.pry
    return House.new(house_hash)
  end

  def Student.all()
    student_hashes = SqlRunner.run("SELECT * FROM students;")
    students = student_hashes.map { |student_hash| Student.new(student_hash) }
    return students
  end

  def Student.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    student_hash = result.first
    return Student.new(student_hash)
  end



end
