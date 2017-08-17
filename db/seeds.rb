# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Creating categories"
Category.destroy_all
categories = [ "Percussion Instruments", "Guitars", "Keyboards", "Bass", "Brass Instruments", "Orchestral Strings", "Wind & Woodwinds" ]

categories.each do |category|
  category_new = Category.new(name: category)
  category_new.save!
end

puts "Finished!"


puts "Creating Users"
User.destroy_all
Instrument.destroy_all


  instruments = [
    {
      title:         "Acoustic Guitar",
      description:   "Fine guitar that I inherited from my Spanish grandfather, with mahogany body",
      price:         "100",
      location:      "Rua Major Rubens Vaz, 456, Gávea, Rio de Janeiro, RJ",
      category:      Category.find_by(name: "Guitars"),
      photo_url:     "https://upload.wikimedia.org/wikipedia/commons/6/6e/Classical_Guitar_two_views2.png"
    },
    {
      title:         "Fender Stratocaster Guitar",
      description:   "Perfect guitar for rocking the world. I can rent for studio sessions and for concerts",
      price:         "15",
      location:      "Rua Duque Estrada, 42, Gávea, Rio de Janeiro, RJ",
      category:      Category.find_by(name: "Guitars"),
      photo_url:     "http://www.fmicassets.com/Damroot/ZoomJpg/10001/0144602580_gtr_frt_001_rr.jpg"
    },
    {
      title:         "Samba Drums",
      description:   "I have the whole set of percussion instruments for a samba bateria",
      price:         "120",
      location:      "Rua Marquês de São Vicente, 42, Gávea, Rio de Janeiro, RJ",
      category:      Category.find_by(name: "Percussion Instruments"),
      photo_url:     "http://correiorural.com.br/jornalcr/wp-content/uploads/2011/11/instrumentos_2.jpg"
    },
    {
      title:         "Stradivarius Violin",
      description:   "Best violin ever. Renting only for pro classical musicians",
      price:         "5000",
      location:      "Rua da Lapa, 10, Lapa, Rio de Janeiro, RJ",
      category:      Category.find_by(name: "Orchestral Strings"),
      photo_url:     "http://www.operamundi.com.br/media/images/1024px-Stradivarius_violin,_Palacio_Real,_Madrid.jpg"
    },
    {
      title:         "Korg Keyboard",
      description:   "Keyboard with millions of sounds",
      price:         "70",
      location:      "Rua Casuarina, 15, Itaipava, Petrópolis, RJ",
      category:      Category.find_by(name: "Keyboards" ),
      photo_url:     "https://www.musik-produktiv.co.uk/pic-010081220xxl/korg-pa4x-musikant-76.jpg"
    },
    {
      title:         "Transversal Flute",
      description:   "É a flauta envolvente que meche com a mente",
      price:         "30",
      location:      "Av. Brasil, 100, Bonsucesso, Rio de Janeiro, RJ",
      category:      Category.find_by(name: "Wind & Woodwinds" ),
      photo_url:     "http://www.lessonsunlimited.com/wp-content/uploads/2015/07/421354-flute.jpg"
    }]

6.times do |i|
  user = User.new(
  email:  Faker::Internet.email,
  password: Faker::Internet.password,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
  )
  user.save!
  instrument_attributes = instruments[i]
  instrument_attributes[:user] = user
  Instrument.create!(instrument_attributes)
end

puts "Finished"

puts "Creating Istruments with pictures"


puts 'Finished!'
