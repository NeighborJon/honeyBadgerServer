# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

rndm = Random.new(1337)

catList = Array["Shenanigan", "Philanthropy", "Education", "Fitness"]

#u1 = User.create(fName: 'Jon', lName: 'Kendrick', email: 'user@example.com')
#u2 = User.create(fName: 'Heath', lName: 'McKay', email: 'user2@example.com')

#a1 = Account.create(user_ID: '1', email: 'user@example.com', password: 'tamale24')
#a2 = Account.create(user_ID: '2', email: 'user2@example.com', password: 'tamale24')


m1 = Message.create(user_ID: '1', recieverID: '2', message: 'Get a fucking move on it')
m2 = Message.create(user_ID: '2', recieverID: '1', message: 'We got a fucking move on it')
m3 = Message.create(user_ID: '1', recieverID: '2', message: "It's neat how we can talk to each other")


Category.create(name: "Philanthropy")
Category.create(name: "Shenanigan")
Category.create(name: "Education")
Category.create(name: "Fitness")

50.times do |i|
	catNum = rndm.rand(0..3)
	
	user = User.create(fName: "User#{i}", lName: "LastName#{i}", email: "user#{i}@example.com",
			description: "Let's face it, I don't live the life of a rock-star or famous athlete ... but those guys are always getting caught cheating on their wives, so why would I want to live that life?

It sure would make writing this more entertaining, and reading it would be much more fun too. I could tell you about all the exotic cities and expensive hotels I've stayed at while being on tour. All the parties, clubs, alcohol and drugs ... it would make for a much more interesting read.",
			 shenaniganExp: 0, fitnessExp: 0, educationExp: 0, philanthropyExp: 0, avatar_path: "http://vignette3.wikia.nocookie.net/inciclopedia/images/c/c8/Derp1.jpg/revision/latest?cb=20110608183440")
	
	user.create_account(email: user.email, password: "pass123")
	
	user.events.create(title: "Event#{i}",

					duration: 1,
					latitude: rndm.rand(38.950000..38.985000),
					longitude: -1*rndm.rand(92.331000..92.33800),
					start: DateTime.now,
					category: catList[catNum],
					description: "It's an event of fun and excitement",)
end

10.times do |i|
	Message.create(user_ID: "#{i}", recieverID: rndm.rand(1..5), message: "Test Message ##{i}")
	
	event = Event.find(1)
	user = User.find(i+3)
	friend = User.find(i+2)
	blocked = User.find(i+5)
	
	user.friends << friend
	friend.friends << user
	event.members << user
	user.blocked << blocked
end
