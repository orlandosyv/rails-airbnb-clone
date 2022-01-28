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
CLOTHES = [
  'cool pink socks',
  'red nightdress',
  'green tweed socks',
  'gray polo (XXL)',
  'pink pants (XS)',
  'extravagant pink coat',
  'gray/orange dotted jumper',
  'purple suit',
  'green sweat shirt (M)',
  'green silk nightdress',
  'sexy leotard',
  'purple alpaca cloak (M)',
  'red alpaca skirt',
  'cool trousers',
  'brown polo',
  'orange blouse',
  'orange leotard (L)',
  'long trunks',
  'red flannel swimming pyjamas',
  'stylish yoga jump suit',
  'cool trousers',
  'wide trousers',
  'black socks',
  'party bikini',
  'cosy swimming sweatpants',
  'party mantle',
  'green party jump suit',
  'corduroy jacket',
  'sexy black kimono',
  'chiffon sweatpants',
  'purple/white dotted overskirt',
  'black/orange dotted coat',
  'casual cloak',
  'cool red t-shirt',
  'white corduroy gloves (L)',
  'orange denim pyjamas',
  'cool black bodysuit',
  'casual pink polo',
  'white corduroy bikini (S)',
  'white/orange paisley kimono',
  'red wool dressing gown (M)',
  'white/black paisley suit',
  'black suede swimming skirt',
  'gray suede swimming jump suit',
  'brown suede pants',
  'green/blue dotted costume',
  'purple/yellow striped sweat shirt',
  'stylish swimming polo',
  'velour costume',
  'blue tweed sweat shirt',
  'white stockings (XL)',
  'alpaca t-shirt',
  'long yoga overcoat',
  'pink flannel tennis sweat shirt',
  'blue yoga leotard',
  'wide party stockings',
  'blue yoga pullover',
  'black pants',
  'tennis kimono',
  'gray velour coat',
  'purple tweed yoga trunks',
  'extravagant pink dress',
  'yellow/brown striped jacket',
  'red tennis gloves',
  'alpaca pyjamas',
  'sexy green stockings',
  'gray denim tennis pullover',
  'extravagant red nightdress',
  'party jump suit',
  'denim apron',
  'short gray nightdress',
  'pink leather yoga nightdress',
  'tennis body stocking',
  'green trousers',
  'blue socks (XXL)',
  'urban swimming bikini',
  'pink suede sweatpants (XS)',
  'blue suede jump suit',
  'green suede costume (XS)',
  'gray alpaca jumper (XS)',
  'red sweatpants (XXL)',
  'gabardine shorts',
  'green swimming gilet',
  'red jacket',
  'casual party socks',
  'trendy swimming sweat shirt',
  'cosy blue apron',
  'tennis bathing trousers',
  'gray/gray paisley mantle',
  'urban night gown',
  'brown alpaca night gown',
  'trendy gray bikini',
  'party coat',
  'purple tweed overskirt (M)',
  'blue gloves (XL)',
  'cosy shirt',
  'long pink mantle',
  'gray dress',
  'green/orange paisley jumper',
  'yoga overcoat',
]

puts "Cleaning database..."
Order.destroy_all
Review.destroy_all
Product.destroy_all

puts 'creating products'

12.times do
 a = CLOTHES.sample
 b = CATEGORIES.sample
 x = Product.create(
   name: "#{a} #{b} ",
   description: "#{a} #{b} #{Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 2)} ",
   category: b,
   price: rand(20..100),
   stock: rand(1..10),
   user_id: 1
 )
  x.photo.attach(
   io: open(Faker::Placeholdit.image(size: '200x200', format: 'jpeg', background_color: :random)),
   filename: "#{Faker::Lorem.characters(number: 6)}.jpg", content_type: "image/jpeg")
  x.save!

end

puts "Finished!"
