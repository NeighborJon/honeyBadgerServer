# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
rndm = Random.new(1337)

5.times do |i|
  user = User.create(name: "User##{i}", fname: "First##{i}", lname: "Last##{i}",email: "user#{i}@test.com")
  UserAccount.create(user_id: user.id, password: "pass##{i}")
  
  Event.create(title: "Event##{i}", 
  				user_id: user.id,
  				description: "Event Description##{i}", 
  				startTime: "2015-1-#{i}", 
  				latitude: rndm.rand(38.950000..38.965000), 
  				longitude: -1*rndm.rand(92.331000..92.33400))

end
