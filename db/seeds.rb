# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Faker::Config.locale = 'ko'

#배열 안에 해시로 정의한다.
User.create([
{ email: "asd@asd.com", password: "123"},
{ email: "qwe@qwe.com", password: "123"},
{ email: "zxc@zxc.com", password: "123"}
])

5.times do
  Post.create(
    title: Faker::Address.state,
    content: Faker::Lorem.words,
    user_id: rand(1..3)
  )
end

10.times do
  Comment.create(
    content: Faker::Name.name,
    post_id: rand(1..5),
    user_id: rand(1..3)
  )
end
