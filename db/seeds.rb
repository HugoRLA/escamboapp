# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [
"Animais e acessórios",
"Desporto",
"Para a sua casa",
"Eletrônica e telemoveis",
"Música",
"Bebês e crianças",
"Moda e beleza",
"Veículos e barcos",
"Imóveis",
"Empregos e negócios"]

puts "Beging Population..."
puts "Inserting Categories..."
categories.each do |category|
  Category.find_or_create_by(description: category )
  puts "Insert Category " + category
end
puts "Inserting Categories...[OK]"
puts "Ended Population"