
require_relative('../db/sql_runner')

class Artist

attr_accessor :name
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

def save()
  sql = "INSERT INTO artists (name)
  VALUES ($1)
  RETURNING id"
  result = SqlRunner.run(sql, [@name])
  @id = result[0]['id'].to_i
end

def Artist.all()
  sql = "SELECT * FROM artists"
  artist_hash_array = SqlRunner.run(sql)
  return artist_hash_array.map {|artist| Artist.new(artist)}
end

def all_albums()
  sql = "SELECT * FROM albums where artist_id = $1"
  result = SqlRunner.run(sql, [@id])
  return result.map {|album| Album.new(album)}
end

def artist_update()
  sql = "UPDATE artists SET name = $1 WHERE id = $2"
  SqlRunner.run(sql, [@name, @id])
end

def delete_artist
  sql = "DELETE FROM artists WHERE id =$1"
  SqlRunner.run(sql, [@id])
end

def Artist.delete_all
  sql = "DELETE FROM artists"
  SqlRunner.run(sql)
end


end
