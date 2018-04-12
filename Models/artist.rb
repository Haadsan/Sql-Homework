# id SERIAL8 PRIMARY KEY,
# first_name VARCHAR(255),
# last_name VARChAR(255)
require('pg')
require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id

  def initialize(options)
    @id = options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @album_id = options['album_id']
  end

  def save
    sql =  "INSERT INTO artists (first_name, last_name, album_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@first_name, @last_name, @album_id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    result = SqlRunner.run(sql)
    return result.map{|artist| Artist.new(artist)}
  end

end
