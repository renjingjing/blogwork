# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["News","Sports", "Pets", "Cooking", "Families", "Communities","Technology"].each do |title|
  Category.create(title: title)
end

8.times do
  title = "#{Faker::Company.bs} #{Faker::Company.bs}"
  body  = "#{Faker::Company.bs} #{Faker::Company.bs} #{Faker::Company.bs} #{Faker::Company.bs} #{Faker::Company.bs}"
  category_id=Random.rand(1..7).to_i
  Post.create({title: title, body: body,category_id:category_id})
end

80.times do
  body  = "#{Faker::Company.bs} #{Faker::Company.bs} #{Faker::Company.bs} #{Faker::Company.bs} #{Faker::Company.bs}"
  post_id=Random.rand(1..8).to_i
  Comment.create({body: body,post_id:post_id})
end

["Fun", "Spirit", "New", "Season", "Hobby", "Hobby", "Advanture"].each do |name|
  Tag.create(name: name)
end
