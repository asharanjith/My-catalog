require_relative './item'
require_relative './music'
require 'json'

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
  end

  def create_genre
    print 'Add genre (Comedy, Horror) : '
    name = gets.chomp
    @genres << Genre.new(name)
    puts "#{name} genre created successfully"
  end

  def save
    albums = @albums.map { |album| { id: album.id, publish_date: album.publish_date, on_spotify: album.on_spotify } }
    save_music = File.write('store/music.json', JSON.pretty_generate(albums))
  end

  def recover_data
    if File.exist?('store/music.json')
      album_store = JSON.parse(File.read('store/music.json'))
    else
      File.write('store/music.json', [])
      album_store = []
    end
    return if album_store.empty?

    album_load = album_store.map { |music| MusicAlbum.new(music['publish_date'], music['on_spotify']) }
    album_load.map { |album| @albums << album }
  end
end
