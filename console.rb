require('pry')
require_relative('Models/album.rb')
require_relative('Models/artist.rb')

album_1 = Album.new({
  "album_name" => "Through the fire"
  })

album_1.save

album_2 = Album.new({
  "album_name" => "Bens wonderland"
  })

album_2.save

artist_1 = Artist.new({
    "first_name" => "Chris",
    "last_name" => "Marshall",
    "album_id" => album_1.id
  })

artist_1.save

artist_2 = Artist.new({
    "first_name" => "Ben",
    "last_name" => "Carsen",
    "album_id" => album_2.id
  })

artist_2.save


binding.pry
nil
