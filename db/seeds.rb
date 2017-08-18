# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts "Destroying all"
Category.destroy_all
User.destroy_all
Instrument.destroy_all
puts "Creating categories"
categories = [ "Percussion Instruments", "Guitars", "Keyboards", "Bass", "Brass Instruments", "Orchestral Strings", "Wind & Woodwinds" ]

categories.each do |category|
  category_new = Category.new(name: category)
  category_new.save!
end

puts "Finished!"



puts "Creating Istruments with pictures"

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
      title:         "Guitarra Bahiana",
      description:   "Guitarra bahaiana directly from salvador bahia, creation of dodo and osmar",
      price:         "100",
      location:      "Salvador, Bahia, Brasil",
      category:      Category.find_by(name: "Keyboards" ),
      photo_url:     "http://www.dcordas.com/site/images/guitarra_bahiana.jpg"
    },
    {
      title:         "Transversal Flute",
      description:   "É a flauta envolvente que meche com a mente",
      price:         "30",
      location:      "Av. Brasil, 100, Bonsucesso, Rio de Janeiro, RJ",
      category:      Category.find_by(name: "Wind & Woodwinds" ),
      photo_url:     "http://www.lessonsunlimited.com/wp-content/uploads/2015/07/421354-flute.jpg"
    },
    {
      title:         "Trombone de Carnaval",
      description:   "Muitos carnavais de história",
      price:         "70",
      location:      "Rua Joaquim Murtinho, 15, Rio de Janeiro, RJ",
      category:      Category.find_by(name: "Brass Instruments" ),
      photo_url:     "http://kimballtrombone.com/wp-content/uploads/2008/07/alto-for-slider1-1024x447.jpg"
    },
    {
      title:         "Fender Bass",
      description:   "Fender Bass from the 70's",
      price:         "80",
      location:      "Belo Horizonte, MG, Brasil",
      category:      Category.find_by(name: "Bass" ),
      photo_url:     "http://medias.audiofanzine.com/images/thumbs3/fender-custom-shop-59-nos-precision-bass-446265.jpg"
    },
    {
      title:         "Saxophone",
      description:   "Saxophone only for studio recording",
      price:         "100",
      location:      "Florianópolis, Brasil",
      category:      Category.find_by(name: "Brass Instruments" ),
      photo_url:     "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Yamaha_Saxophone_YAS-62.tif/lossy-page1-220px-Yamaha_Saxophone_YAS-62.tif.jpg"
    },
    {
      title:         "Jazz Bass",
      description:   "Perfect for jamsessions!",
      price:         "100",
      location:      "São Paulo",
      category:      Category.find_by(name: "Bass" ),
      photo_url:     "https://stuff.fendergarage.com/images/c/b/M/fcwd-products-bass-jazz-01-hero-american-standard.jpg"
    },
    {
      title:         "Full Drum Set",
      description:   "The Complete Standard Box Set includes mute sizes to fit 12, 13 & 16 toms, 14 snare, crash mute, 20 ride mute, 14 hi hat mute, and the universal size adjustable SoundOff Bass Drum Mute.",
      price:         "300",
      location:      "Brasília, Brasil",
      category:      Category.find_by(name: "Brass Instruments" ),
      photo_url:     "https://az58332.vo.msecnd.net/e88dd2e9fff747f090c792316c22131c/Images/Products34328-635x575-990247.jpg"
    },
    {
      title:         "Guitarra Bahiana",
      description:   "Directly from Salvador Bahia",
      price:         "100",
      location:      "Salvador, Bahia, Brasil",
      category:      Category.find_by(name: "Brass Instruments" ),
      photo_url:     "http://www.dcordas.com/site/images/guitarra_bahiana.jpg"
    }]

puts "Creating Users"

12.times do |i|
  user = User.new(
  email:  Faker::Internet.email,
  password: Faker::Internet.password,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name)
  user.avatar_url = Faker::Avatar.image
  user.save!
  instrument_attributes = instruments[i]
  instrument_attributes[:user] = user
  Instrument.create!(instrument_attributes)
end

puts 'Finished!'
