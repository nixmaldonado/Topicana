# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "admin@topicana.com", admin: true, password: "123123123", password_confirmation: "123123123")
Topic.create(title: "Twitter Crashes", body: "The end of an era?")
Topic.create(title: "Dogs", body: "The real best friend of men?")
Topic.create(title: "Global Warming", body: "A real danger to humanity?")


