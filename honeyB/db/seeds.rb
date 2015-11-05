# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create(fName: 'Jon', lName: 'Kendrick', email: 'user@example.com')
u2 = User.create(fName: 'Heath', lName: 'McKay', email: 'user2@example.com')

a1 = Account.create(accountID: u1, email: 'user@example.com', password: 'tamale24')
a2 = Account.create(accountID: u2, email: 'user2@example.com', password: 'tamale24')

m1 = Message.create(user_ID: '1', recieverID: '2', message: 'Get a fucking move on it')

