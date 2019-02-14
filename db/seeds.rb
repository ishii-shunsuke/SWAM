# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(title:"HOME", price: 1000)
Product.create(title:"元気？", price: 1330)

user = User.new(
	last_name: "山田",
	first_name: "太郎",
	last_name_kana: "ヤマダ",
    first_name_kana: "タロウ",
    birthday: "1991-11-16",
	gender: 0,
    phone_number: "090-0000-0000",
    email: "aaa@aaa.com",
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
	gender: 1,
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
	gender: 0,
    phone_number: "090-2222-2222",
    email: "suda@suda.com",
    post_number: "222-2222",
    prefectures: 2,
	city: "青森市",
    block: "中央区3-1",
	password: "suda")
user.save!

Cart.create(product_id: 1, user_id: 1)
Cart.create(product_id: 2, user_id: 1)