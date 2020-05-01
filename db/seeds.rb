# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'a@a',
   password: 'aaaaaa',
)


Genre.create!(
	name: 'ケーキ',
	)

Item.create!(
	genre_id: '7',
	name: '苺のショートケーキ',
	introduction: '当店一番人気のケーキです。',
	untax_price: '500',
	)