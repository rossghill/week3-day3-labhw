require ('pry-byebug')
require_relative('./models/album')
require_relative('./models/artist')

artist1 = Artist.new({'name' => 'Eminem'})
artist2 = Artist.new({'name' => 'Vishal'})
artist3 = Artist.new({'name' => 'Ross'})

artist1.save
artist2.save
artist3.save
#
# find_1st_artist = Artist.find(artist1.id)
#
# # Artist.delete_all
# #
# # hello = Artist.all

album1 = Album.new({'title' => 'Superman', 'genre' => 'Rap', 'artist_id' => artist1.id})
album2 = Album.new({'title' => 'Candy', 'genre' => 'Indie', 'artist_id' => artist1.id})
album3 = Album.new({'title' => 'Edinburgh', 'genre' => 'Classical', 'artist_id' => artist3.id})

album1.save
album2.save
album3.save

hello = Album.find(album1.id)
#
# Album.delete_all
#
# hello1 = Album.all

#
#
# # result1 = Artist.all()
# collections = Album.all()
#
# albums = artist1.all_albums
#
# artist = album1.what_artist
#
# artist1.name = "Craig"
# artist1.artist_update
#
# hello = artist3.delete_artist
#
# result1 = Artist.all()


binding.pry
nil
