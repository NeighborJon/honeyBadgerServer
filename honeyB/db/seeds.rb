# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

rndm = Random.new(Time.now.to_f)

catList = Array["Shenanigan", "Philanthropy", "Education", "Fitness"]
fnameList = Array["Jon", "AJ", "Brent", "Miles", "Jeff", "Joe", "Sarah", "Jennifer", "Katie", "Dana", "Bill", "Heath", "Tom", "Jarret", "Erika", "Mark", "Julie", "Mary", "Kelly", "Beth", "Carrie", "Catherine", "Laura", "Lara"]
lnameList = Array["Williams", "Johnson", "Rodgers", "Brady", "Manning", "Smith", "Jefferson", "Washington", "James", "Anthony", "Bradley", "Dempsey", "Altidore", "McGwire", "Jordan", "Bird", "Charles", "Maclin", "Moss", "Marino", "Perry"]

m1 = Message.create(user_ID: '1', recieverID: '2', message: 'Test messages')
m2 = Message.create(user_ID: '2', recieverID: '1', message: 'We got a test message')
m3 = Message.create(user_ID: '1', recieverID: '2', message: "It's neat how we can talk to each other")


Category.create(name: "Philanthropy")
Category.create(name: "Shenanigan")
Category.create(name: "Education")
Category.create(name: "Fitness")



(1..101).each do |i|
	catNum = rndm.rand(0..3)
	fnameNum = rndm.rand(0..(fnameList.length-1))
	lnameNum = rndm.rand(0..(lnameList.length-1))
	email = fnameList[fnameNum].downcase+"."+lnameList[lnameNum].downcase+rndm.rand(0..200).to_s+"@example.com"
	
	
	user = User.new(fName: fnameList[fnameNum], lName: lnameList[lnameNum], email: email,
			description: "Generic user description",
			 shenaniganExp: 0, fitnessExp: 0, educationExp: 0, philanthropyExp: 0, avatar_path: "http://clickmedix.com/home/wp-content/uploads/2011/12/504px-Android_robot-252x300.png")

	
	account = user.build_account(email: user.email, password: "pass123")
	user.save
	account.save
	
	user.events.create(title: "Event#{i}",
					duration: 1,
					latitude: rndm.rand(38.860000..39.000000),
					longitude: -1*rndm.rand(92.250000..92.400000),
					start: DateTime.new(2015,12,6,12).advance(:days => +rndm.rand(0..40), :hours => +rndm.rand(0..12)),
					category: catList[catNum],
					description: "It's an event of fun and excitement",)
end

10.times do |i|
	Message.create(user_ID: "#{i}", recieverID: rndm.rand(1..10), message: "Test Message ##{i}")
	
end

(2..5).each do |i|
	user = User.find(i)
	event = Event.find(1)
	event.members << user
end
