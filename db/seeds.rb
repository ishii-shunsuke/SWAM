# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Artist.create(artist_name:"Mr.children")
Artist.create(artist_name:"尾崎豊")
Label.create(label_name:"ミスチル")
Label.create(label_name:"オザキ")
Category.create(category_name: "Jpop")
Category.create(category_name: "ozaki")
Disc.create(disc_number: "1", product_id:13)
Disc.create(disc_number: "10", product_id:14)
Song.create(name: "aamrchildren", disc_id:1)
Song.create(name: "終わりなき旅", disc_id:1)
Song.create(name: "I love you", disc_id:2)



Product.create(
	title:"HOME",
	artist_id: 1,
	price: 2000,
    label_id: 1,
    category_id: 1,
    period: "2000年代前半",
    stock: 10)

Product.create(
	title:"I love you",
	artist_id: 2,
	price: 1300,
    label_id: 2,
    category_id: 2,
    period: "1980年代",
    stock: 20)