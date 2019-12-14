# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create(
  email: "jufcardenasmo@unal.edu.co",
  password: "123456",
  name: "Juan Felipe Cardenas Morales",
  nickname: "jufcardenasmo"
)
User.create(
  email: "rafaguaa@unal.edu.co",
  password: "123456",
  name: "Rodrigo Alexander Fagua Arevalo",
  nickname: "rafaguaa"
)
User.create(
  email: "dsnietom@unal.edu.co",
  password: "123456",
  name: "David Styven Nieto Marin",
  nickname: "dsnietom"
)
User.create(
  email: "dsvalencias@unal.edu.co",
  password: "123456",
  name: "Dave Sebastian Valencia Salazar",
  nickname: "dsvalencias"
)
User.create(
  email: "lgavendanoa@unal.edu.co",
  password: "123456",
  name: "Luis Gerson Avendano Alvira",
  nickname: "lgavendanoa"
)
User.create(
  email: "lahiguarans@unal.edu.co",
  password: "123456",
  name: "Luis Alejandro Higuaran Serrano",
  nickname: "lahiguarans"
)
