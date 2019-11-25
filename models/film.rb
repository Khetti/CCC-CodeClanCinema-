require_relative("../db/sql_runner.rb")

class Film

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @price = details['price'].to_i
  end

  def save()
    sql = "INSERT INTO films
    (
      title,
      price
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@title, @price]
    customer = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

end
