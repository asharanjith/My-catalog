require_relative './item'

class MusicList < Item
  attr_accessor :album, :genre

  def initialize
    @albums = []
    @genres = []
  end

  def list_music
    puts 'No music added' if @music.empty?
    @albums.each { |album| puts "#{ablum.id} Publish date: #{album.publish_date} On spotify: #{album.on_spotify}" }
    puts ''
  end

  def list_genre
    puts 'No genre added' if @music.empty?
    @genres.each { |genre| puts "#{genre.id}. #{genre.name}" }
    puts ''
  end

  def create_album
    print 'Publish date:'
    publish_date = gets.chomp
    print 'On spotify (true,false) :'
    on_spotify = gets.chomp
    on_spotify == gets.chomp
    if on_spotify !== true || false
      puts 'Invalid input'
    else
      @albums << Music.new(publish_date, spotify)
    end
    puts 'Album created successfully'
  end

  def create_genre
    print 'Add genre (Comedy, Horror) : '
    name = gets.chomp
    @genres << Genre.new(name)
    puts "#{name} genre created successfully"
  end

end
