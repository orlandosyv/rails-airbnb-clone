# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Faker::Name.name      #=> "Christophe Bartell"

# Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"

CATEGORIES = %w[Polos Camisas Jeans Vestidos Pijamas Casacas Chompas]

puts "Cleaning database..."
Product.destroy_all

puts 'creating products'

14.times do
 x = Product.create(
   name: Faker::Lorem.sentence(word_count: 3),
   description: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
   category: CATEGORIES.sample,
   price: rand(20..100),
   stock: rand(1..10),
   user_id: 1
 )
 x.photo.attach(
  io: open(Faker::Placeholdit.image(size: '200x200', format: 'jpeg', background_color: :random)),
  filename: "#{Faker::Lorem.characters(number: 8)}.jpg", content_type: "image/jpeg")
 x.save!

end


# polo = Product.create(name: 'Polo Blanco', description: 'polo de algodon pima', category: 'Polos' , price: 10, stock: 1, user_id:1)
# # polo.photo.attach(io: open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_600,w_600/jjnpprepy6ktoh1afgdz.jpg"), filename: "nicolas.png", content_type: "image/jpeg") nico.save! 
# Product.create(name: 'Jean Azul', description: 'jean tipo vaquero', category: 'Jeans' , price: 30, stock: 2, user_id:1)
# Product.create(name: 'Camisa Lacoste Celeste', description: 'camisa modelo lacoste azul', category: 'Camisas' , price: 45, stock: 4, user_id:1)
# Product.create(name: 'Camisa Tommy gris', description: 'camisa modelo tommy gris oscuro', category: 'Camisas' , price: 55, stock: 1, user_id:1)
# Product.create(name: 'Polo Negro', description: 'polo negro de algodon', category: 'Polos' , price: 20, stock: 2, user_id:1)
# Product.create(name: 'Jean Negro', description: 'Jean negro', category: 'Jeans' , price: 70, stock: 4, user_id:1)
# Product.create(name: 'Camisa D&G azul', description: 'Camisa D&G azul claro', category: 'Camisas' , price: 55, stock: 2, user_id:1)
# Product.create(name: 'Vestido rojo seda', description: 'Vestido rojo seda', category: 'Vestidos' , price: 100, stock: 1,  user_id:1)

puts "Finished!"
