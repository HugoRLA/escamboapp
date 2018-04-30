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


puts "Creating Categories..."
categories.each do |category|
  Category.find_or_create_by(description: category )
end
puts "Creating Categories...[SUCCESS]"

puts "Creating Default Admin..."
Admin.create!(name: "supadm", role: 0,email: "admin@admin", password: "admin1", password_confirmation: "admin1" )
puts "Creating Default Admin...[SUCCESS]"

puts "Creating Default Member..."
Member.create!(email: "member@member", password: "123456", password_confirmation: "123456" )
puts "Creating Default Member...[SUCCESS]"
