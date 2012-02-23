# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

u1 = User.create!(:email => 'u1@email.com', :password => '123213')
u2 = User.create!(:email => 'u2@email.com', :password => '123213')
u3 = User.create!(:email => 'u3@email.com', :password => '123213')

b1 = Bid.create(:user => u1, :title => 'Sample bid 1', :join_num => 10)
b2 = Bid.create(:user => u2, :title => 'Sample bid 2', :join_num => 10)
b3 = Bid.create(:user => u3, :title => 'Sample bid 3', :join_num => 10)

