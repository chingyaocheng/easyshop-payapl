# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Genarating default categories"
sleep 3
Category.create(:name => 'Pasta')
Category.create(:name => 'Rice')
Category.create(:name => 'Soda')

