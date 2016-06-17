# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rake::Task['db:drop'].execute
Rake::Task['db:create'].execute
Rake::Task['db:migrate'].execute
Rake::Task['admin:create'].execute

3.times do |i|
  t = Tag.create! name: "tag_#{i}", title: Faker::Lorem.word
  3.times do
    a = Article.create! name: Faker::Lorem.word, title: Faker::Lorem.word, text: Faker::Lorem.paragraph(3)
    a.article_tags.create! tag_id: t.id
  end
end
