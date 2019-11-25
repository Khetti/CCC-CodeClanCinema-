require_relative("../db/sql_runner.rb")
require_relative("film.rb")

class Customer

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @funds = details['funds'].to_i
  end

end
