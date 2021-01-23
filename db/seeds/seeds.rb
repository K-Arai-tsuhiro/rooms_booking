# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

User.create!(
  name: "ll ll",
  email: "ll@ll.ll",
  password: "llllll"
  )
  
Profile.create!(
  profile_photo: open('./db/fixtures/camellia.jpg'),
  introduction: "test",
  user_id: 1
  )

10.times do |n|
  User.create!(
    name: "user #{n+1}",
    email: "user#{n+1}@example.com",
    password: "password")
    
  Profile.create!(
    profile_photo: "",
    introduction: "hello",
    user_id: n+2
    )
    
  Room.create!(
    roomname: "Hotel#{n+1}",
    fee: 5000,
    address: "東京都",
    description: "快適なシティーホテル",
    image: open("./db/fixtures/domitory.png"),
    user_id: n+1
    )
    
  Room.create!(
    roomname: "Residence#{n+1}",
    fee: 6000,
    address: "埼玉県",
    description: "駅近のマンション",
    image: open("./db/fixtures/img1.png"),
    user_id: n+1
  )
  
  Room.create!(
    roomname: "Habitation#{n+1}",
    fee: 4000,
    address: "千葉県",
    description: "ショピングセンターに近いアパート",
    image: open("./db/fixtures/img2.png"),
    user_id: n+1
  )
  
  Room.create!(
    roomname: "Camping#{n+1}",
    fee: 3000,
    address: "群馬県",
    description: "ワイルドなキャンプ場",
    image: open("./db/fixtures/mountain1.png"),
    user_id: n+1
  ) 
end