require ('pry-byebug')
require_relative('./models/album')
require_relative('./models/artist')

artist1 = Artist.new({'name' => 'Eminem'})
artist2 = Artist.new({'name' => 'Vishal'})
artist3 = Artist.new({'name' => 'Ross'})

artist1.save
artist2.save
artist3.save


album1 = Album.new({'title' => 'Superman', 'genre' => 'Rap', 'artist_id' => artist1.id})
album2 = Album.new({'title' => 'Candy', 'genre' => 'Indie', 'artist_id' => artist1.id})
album3 = Album.new({'title' => 'Edinburgh', 'genre' => 'Classical', 'artist_id' => artist3.id})

album1.save
album2.save
album3.save


result1 = Artist.all()
collections = Album.all()

albums = artist1.all_albums

artist = album1.what_artist


binding.pry
nil
