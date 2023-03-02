require_relative './item'
require_relative './music'
require_relative './genre'

class MusicList
  attr_accessor :album, :genre

  def initialize
    @albums = []
    @genres = []
  end

  def list_music
    puts 'No music added' if @albums.empty?
    @albums.each { |album| puts "id: #{album.id} Publish date: #{album.publish_date} On spotify: #{album.on_spotify}" }
    puts ''
  end

  def list_genre
    puts 'No genre added' if @genres.empty?
    @genres.each { |genre| puts "#{genre.id}. #{genre.name}" }
    puts ''
  end

  def create_album
    print 'Publish date:'
    publish_date = gets.chomp
    print 'On spotify (true,false) :'
    on_spotify = gets.chomp

    @albums << MusicAlbum.new(publish_date, on_spotify)
    puts 'Album created successfully'

    print 'Add genre (Comedy, Horror) : '
    name = gets.chomp
    @genres << Genre.new(name)
    puts "#{name} genre created successfully"
  end
end
