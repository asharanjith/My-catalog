require_relative './item'
require_relative './music'
require_relative './genre'
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
    @genres.each { |genre| puts "id: #{genre.id} Name: #{genre.name}" }
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

  def save
    albums = @albums.map { |album| { id: album.id, publish_date: album.publish_date, on_spotify: album.on_spotify } }
    File.write('json_files/music.json', JSON.pretty_generate(albums))
  end

  def recover_data
    return unless File.exist?('json_files/music.json')

    album_store = begin
      JSON.parse(File.read('json_files/music.json'))
    rescue StandardError
      []
    end
    album_load = album_store.map { |music| MusicAlbum.new(music['publish_date'], music['on_spotify']) }
    @albums.concat(album_load) unless album_load.empty?
  end

  def save_genre
    genres = @genres.map { |genre| { name: genre.name } }
    File.write('json_files/genre.json', JSON.pretty_generate(genres))
  end

  def recover_genre
    return unless File.exist?('json_files/genre.json')

    genre_store = begin
      JSON.parse(File.read('json_files/genre.json'))
    rescue StandardError
      []
    end
    genre_load = genre_store.map { |genre| Genre.new(genre['name']) }
    @genres.concat(genre_load) unless genre_load.empty?
  end
end
