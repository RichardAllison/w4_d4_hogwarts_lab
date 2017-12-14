require_relative("../db/sql_runner")
require("pry-byebug")
class House

  attr_reader :id, :name, :url

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @url = options["url"]
  end

  def save()
    sql = "INSERT INTO houses (name, url)
    VALUES ($1, $2) RETURNING id;"
    values = [@name, @url]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def House.all()
    house_hashes = SqlRunner.run("SELECT * FROM houses;")
    houses = house_hashes.map { |house_hash| House.new(house_hash) }
    return houses
  end

  def House.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    house_hash = result.first
    return House.new(house_hash)
  end

end
