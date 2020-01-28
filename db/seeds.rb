# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
  firstname = Faker::Name.first_name
  surname = Faker::Name.last_name
  email = "example-#{n+2}@railstutorial.org"
  gender = Faker::Gender.binary_type.downcase
  birthdate = Faker::Date.birthday(min_age: 18, max_age: 65)
  password = 'password'

  User.create!(firstname: firstname,
               surname: surname,
               email: email,
               gender: gender,
               birthdate: birthdate,
               password: password,
               password_confirmation: password)

end