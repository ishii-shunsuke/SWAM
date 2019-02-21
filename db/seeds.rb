# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(
	last_name: "山田",
	first_name: "太郎",
	last_name_kana: "ヤマダ",
    first_name_kana: "タロウ",
    birthday: "1991-11-16",
	gender: 1,
    phone_number: "090-0000-0000",
    email: "aaazzzaaa@yamadfa.com",
    post_number: "000-0000",
    prefectures: 1,
	city: "札幌市",
    block: "中央区北23条西50丁目3-2",
	password: "aaaaaa")
user.save!

user = User.new(
	last_name: "有村",
	first_name: "架純",
	last_name_kana: "アリムラ",
    first_name_kana: "カスミ",
    birthday: "1993-2-13",
	gender: 2,
    phone_number: "090-1111-1111",
    email: "arimura@arimura.com",
    post_number: "111-1111",
    prefectures: 13,
	city: "渋谷区",
    block: "有村3-2 メゾンドアリムラ",
	password: "arimura")
user.save!

user = User.new(
	last_name: "菅田",
	first_name: "将暉",
	last_name_kana: "スダ",
    first_name_kana: "マサキ",
    birthday: "1993-2-21",
	gender: 1,
    phone_number: "090-2222-2222",
    email: "sudazzz@suda.com",
    post_number: "222-2222",
    prefectures: 2,
	city: "青森市",
    block: "中央区3-1",
	password: "sudasuda")
user.save!

ShippingAddress.create(
	user_id: 1,
	last_name: "山田",
	first_name: "花子",
	last_name_kana: "ヤマダ",
	first_name_kana: "ハナコ",
	post_number: "123-4567",
	prefectures: 1,
	city: "小樽市",
    block: "花園2-13-1",
	phone_number: "090-0000-0000"
	)
ShippingAddress.create(
	user_id: 2,
	last_name: "有村",
	first_name: "藍里",
	last_name_kana: "アリムラ",
	first_name_kana: "アイリ",
	post_number: "123-4567",
	prefectures: 1,
	city: "小樽市",
    block: "花園2-13-1",
	phone_number: "090-0000-0000",
	)

admin = Admin.new(email:"admin@admin", password: "aaaaaa")
admin.save!

Artist.create(artist_name:"Mr.children")
Artist.create(artist_name:"尾崎豊")
Artist.create(artist_name:"坂本九")
Artist.create(artist_name:"X")

Label.create(label_name:"ミスチル")
Label.create(label_name:"オザキ")
Label.create(label_name:"サカモト")
Label.create(label_name:"エックス")

Category.create(category_name: "Jpop")
Category.create(category_name: "ballade")
Category.create(category_name: "rock")



product = Product.new(
    title:"HOME",
    artist_id: 1,
    price: 2000,
   label_id: 1,
   category_id: 1,
   period: "2000年代前半",
   stock: 10)
product.save!

product = Product.new(
    title:"十七歳の地図",
    artist_id: 2,
    price: 1300,
   label_id: 2,
   category_id: 1,
   period: "1990年代",
   stock: 20)
product.save!

product = Product.new(
    title:"上を向いて歩こう",
    artist_id: 3,
    price: 1300,
   label_id: 3,
   category_id: 2,
   period: "1960年代",
   stock: 20)
product.save!

product = Product.new(
    title:"紅",
    artist_id: 4,
    price: 1300,
   label_id: 4,
   category_id: 3,
   period: "1980年代",
   stock: 20)
product.save!



Disc.create(disc_number: "1", product_id:1)
Disc.create(disc_number: "2", product_id:1)
Disc.create(disc_number: "3", product_id:1)
Disc.create(disc_number: "1", product_id:2)
Disc.create(disc_number: "1", product_id:3)
Disc.create(disc_number: "1", product_id:4)



i = 1
while i <= 10
    Song.create(name: "箒星1-#{i}", song_number: i , disc_id: 1)
    i += 1
end

i = 1
while i <= 11
    Song.create(name: "しるし1-#{i}", song_number: i, disc_id: 2)
    i += 1
end

i = 1
while i <= 9
    Song.create(name: "フェイク1-#{i}", song_number: i, disc_id: 3)
    i += 1
end

i = 1
while i <= 10
    Song.create(name: "I LOVE YOU1-#{i}", song_number: i, disc_id: 4)
    i += 1
end

i = 1
while i <= 20
    Song.create(name: "上を向いて歩こう1-#{i}", song_number: i, disc_id: 5)
    i += 1
end

Song.create(name: "紅", song_number: 1, disc_id:6)
Song.create(name: "20th CENTURY BOY", song_number: 2, disc_id:6)


Cart.create(product_id: 1, user_id: 1, number:3)
Cart.create(product_id: 2, user_id: 1, number:5)
Cart.create(product_id: 1, user_id: 2, number:3)
Cart.create(product_id: 2, user_id: 3, number:5)