require_relative("../db/sql_runner.rb")
require_relative("film.rb")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @funds = details['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      funds
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end

  def update(name, funds)
    sql = "UPDATE customers SET
    (name, funds) = ($1, $2)
    WHERE id = $3;"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    WHERE customer_id = $1;"
    values = [@id]
    films = SqlRunner.run(sql, values)
    result = films.map{|film| Film.new(film)}
    return result
  end

end
