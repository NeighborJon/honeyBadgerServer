# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

rndm = Random.new(1337)

#u1 = User.create(fName: 'Jon', lName: 'Kendrick', email: 'user@example.com')
#u2 = User.create(fName: 'Heath', lName: 'McKay', email: 'user2@example.com')

#a1 = Account.create(user_ID: '1', email: 'user@example.com', password: 'tamale24')
#a2 = Account.create(user_ID: '2', email: 'user2@example.com', password: 'tamale24')

#m1 = Message.create(user_ID: '1', recieverID: '2', message: 'Get a fucking move on it')
#m2 = Message.create(user_ID: '2', recieverID: '1', message: 'We got a fucking move on it')

5.times do |i|
	user = User.create(fName: "User#{i}", lName: "LastName#{i}", email: "user#{i}@example.com")
	
	Account.create(user_ID: user.id, email: user.email, password: "pass123")
	
	user.events.create(title: "Event##{i}",
					longitude: rndm.rand(38.950000..38.965000),
					latitude: -1*rndm.rand(92.331000..92.33400),
					start: DateTime.now,
					description: "It's an event of fun and excitement",)
end

5.times do |i|
	Message.create(user_ID: "#{i}", recieverID: rndm.rand(1..5), message: "Test Message ##{i}")
end