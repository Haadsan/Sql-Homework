# id SERIAL8 PRIMARY KEY,
# album_name VARCHAR(255),
# artist_id INT REFERENCES artist(id)
require('pg')
require_relative('artist.rb')
require_relative('album.rb')
require_relative('../db/sql_runner.rb')
class Album

  attr_reader :id
  def initialize(options)
    @id = options['id'].to_i
    @album_name = options['album_name']
  end

   def save
     sql = "INSERT INTO albums (album_name) VALUES ($1) RETURNING id;"
     values = [@album_name]
     result = SqlRunner.run(sql, values)
     @id = result[0]['id'].to_i
   end

   def self.all()
     sql = "SELECT * FROM albums;"
     result = SqlRunner.run(sql)
     return result.map{|album| Album.new(album)}
   end
end
