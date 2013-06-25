# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

500.times.each do |n|
  idea = Idea.create(
    :name => Faker::HipsterIpsum.words.join(' '),
    :description => Faker::Lorem.paragraph,
    :range => rand(0..10),
    :completed => [true, false].sample
  )
  puts "#{n} of 500 - #{idea.name}"
end

2000.times.each do |n|
  task = Task.create(
    :name => Faker::HipsterIpsum.words.join(' '),
    :notes => Faker::Lorem.paragraph,
    :idea_id => Idea.order("random()").first.id,
    :completed => [true, false].sample
  )
  puts "#{n} of 2000 - #{task.name}"
end
