# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating categories"
categories = [ "Percussion Instruments", "Guitars", "Keyboards", "Bass", "Brass Instruments", "Orchestral Strings", "Wind & Woodwinds" ]

categories.each do |category|
  category_new = Category.new(name: category)
  category_new.save!
end

puts "Finished!"

