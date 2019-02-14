# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(title:"HOME", price: 1000)
Product.create(title:"元気？", price: 1330)
user = User.new(last_name: "山田", first_name: "太郎", phone_number: "090-1111-2222", prefectures: 3, city:"札幌市", block: "中央区北23条西50丁目3-2", email:"aaaaa@aaaa.com", password: "aaaaaa")
user.save!
Cart.create(product_id: 1, user_id: 1)
Cart.create(product_id: 2, user_id: 1)

admin = Admin.new(email:"a@a", password: "aaaaaa")
admin.save!