# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |i|
  user = User.create(name: "User##{i}", fname: "First##{i}", lname: "Last##{i}",email: "user#{i}@test.com")
  UserAccount.create(user_id: user.id, password: "pass##{i}")

end
