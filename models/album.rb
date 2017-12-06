require_relative('../db/sql_runner')

class Album

attr_accessor :title, :genre
attr_reader :id, :artist_id

  def initialize( )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i

  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
    VALUES ($1, $2, $3)
    RETURNING id"
    result = SqlRunner.run(sql, [@title, @genre, @artist_id])
    @id = result[0]['id'].to_i
  end

  def Album.all()
    sql = "SELECT * FROM albums"
    album_hash_array = SqlRunner.run(sql)
    return album_hash_array.map {|album| Album.new(album)}
  end

def what_artist
  sql = "SELECT * from artists where id = $1"
  result = SqlRunner.run(sql, [@artist_id])
  return result.map {|artist| Artist.new(artist)}
end

def update()
  sql = "UPDATE albums SET (title, genre, customer_id) = ($1, $2, $3) WHERE id = $4"
  SqlRunner.run(sql, [@title, @genre, @customer_id, @id])
end

end
