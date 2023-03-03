require_relative './item'
require_relative './game'
require_relative './author'
require 'json'

class GameList
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def add_game
    print 'Publish date: '
    publish_date = gets.chomp
    print 'Enter multiplayer: '
    multiplayer = gets.chomp
    print 'Last played on date?: '
    last_played_at = gets.chomp
    print 'Please, type the game author first name: '
    first_name = gets.chomp
    print 'Please, type the game author last name: '
    last_name = gets.chomp

    new_game = Game.new(multiplayer, last_played_at, publish_date)
    @games.push(new_game)
    JSON.dump(@games, File.open('json_files/games.json', 'w'))
    puts 'New game added'

    author = Author.new(first_name, last_name)
    @authors.push(author)
    JSON.dump(@authors, File.open('json_files/authors.json', 'w'))
    puts 'New author added'
  end

  def list_games
    puts 'Games list is empty! Add a game.' if @games.empty?
    JSON.parse(File.read('json_files/games.json')).each do |game|
      @games.push(Game.new(game['multiplayer'], game['last_played_at'], game['publish_date']))
    end

    @games.each do |game|
     puts "Last played at: #{game.last_played_at} - published: #{game.publish_date}" - "Multiplayer: #{game.multiplayer}"
    end
  end

  def list_authors
    @authors.each do |author|
      puts "ID: #{author.id}, First name: #{author.first_name}, Last name: #{author.last_name}"
    end
  end

end
