require_relative( 'models/customer.rb' )
require_relative( 'models/film.rb' )
require_relative( 'models/ticket.rb' )

require('pry')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

binding.pry
nil
