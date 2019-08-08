# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all

10.times do 
  city = City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end
puts "10 villes ont été générées."

10.times do 
  pwd = Faker::Internet.password
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::ChuckNorris.fact, email: Faker::Internet.email, age: rand(18..90), password: pwd, password_confirmation: pwd, city_id: rand(1..10) )
end

puts "10 users ont été générées."

20.times do
  gossip = Gossip.create!(title: Faker::Book.title, content: Faker::Movie.quote, user_id: rand(1..10))
end

puts "20 gossips ont été générées."

10.times do
  tag = Tag.create!(title: "##{Faker::Lorem.word}" )
end
puts "10 tags ont été générées."

(1..20).each do |i|
  while TagLink.where(gossip_id: i).empty? == true
    tag_link = TagLink.create!(tag: Tag.find(rand(1..10)), gossip: Gossip.find(rand(1..20)) )
  end
end

puts "La table de liaison des tags et gossips a été générée."

10.times do
  sender = User.all.sample
  recipient_list = []
  User.all.each { |el| recipient_list << el if el != sender }
  recipient = recipient_list.sample
  private_message = PrivateMessage.create!(content: Faker::Lorem.sentence, recipient: User.find(rand(1..10)), sender: User.find(rand(1..10)) )
end
puts "10 messages privées ont été générés."