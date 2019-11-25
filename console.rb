require_relative( 'models/customer.rb' )
require_relative( 'models/film.rb' )
require_relative( 'models/ticket.rb' )

require('pry')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({ 'name' => 'Roger Ebert', 'funds' => 100 })
customer1.save()
customer2 = Customer.new({ 'name' => 'Leonard Maltin', 'funds' => 200 })
customer2.save()
customer3 = Customer.new({ 'name' => 'Mark Kermode', 'funds' => 50 })
customer3.save()
customer4 = Customer.new({ 'name' => 'Francois Truffaut', 'funds' => 250 })
customer4.save()

film1 = Film.new({ 'title' => 'The Favourite', 'price' => 25 })
film1.save()
film2 = Film.new({ 'title' => 'The Sisters Brothers', 'price' => 50 })
film2.save()
film3 = Film.new({ 'title' => 'The Ballad of Buster Scruggs', 'price' => 30 })
film3.save()
film4 = Film.new({ 'title' => 'Joker', 'price' => 40 })
film4.save()

ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id })
ticket1.save()
ticket2 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film2.id })
ticket2.save()
ticket3 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film3.id })
ticket3.save()
ticket4 = Ticket.new({ 'customer_id' => customer4.id, 'film_id' => film4.id })
ticket4.save()
ticket5 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film3.id })
ticket5.save()
ticket6 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film4.id })
ticket6.save()

binding.pry
nil
