require 'faker'

PrivateMessage.destroy_all
GossipTag.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

cities = Array.new
users = Array.new
gossips = Array.new
tags = Array.new
gossip_tags = Array.new
private_messages = Array.new

10.times do
  city = City.create(name: Faker::Address.city, zip_code: Faker::Address.postcode)
  cities << city
end
puts "10 Cities créées"

10.times do
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10), email: Faker::Internet.email, age: Faker::Number.within(range: 18..70), city: cities.sample, password: Faker::Lorem.sentence(word_count: 1))
  users << user
end
puts "10 Users créés"

20.times do
  gossip = Gossip.create(title: Faker::Lorem.sentence(word_count: 3), content: Faker::Lorem.sentence(word_count: 10), user: users.sample)
  gossips << gossip
end
puts "20 Gossips créés"

10.times do
  tag = Tag.create(title: Faker::Lorem.word)
  tags << tag
end
puts "10 Tags créés"

40.times do
  gossip_tag = GossipTag.create(gossip: gossips.sample, tag:tags.sample)
  gossip_tags << gossip_tag
end
puts "40 GossipTags créés"

20.times do
  private_message = PrivateMessage.create(sender: users.sample, recipient: users.sample)
  private_messages << private_message
end
puts "20 Messages créés"
