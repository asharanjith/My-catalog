require './storage_utility/list_add_book'
require './storage_utility/book_storage'
require_relative './classes/music_list'
require './classes/list_add_book'

class App
  def initialize
    @music_list = MusicList.new
    @list_add_book = ListAddBook.new
  end

  def options
    choices = [
      'List all books',
      'List all music albums',
      'List all games',
      'List all genres',
      'List all authors',
      'List all labels',
      'Add a book',
      'Add a music album',
      'Add a game',
      'Exit'
    ]
    puts 'Please choose an option:'
    choices.each_with_index do |choice, index|
      puts "#{index + 1}. #{choice}"
    end
  end

  def methods_list
    {
      1 => 'list_books',
      2 => 'list_music_albums',
      3 => 'list_games',
      4 => 'list_genres',
      5 => 'list_authors',
      6 => 'list_labels',
      7 => 'add_book',
      8 => 'add_music_album',
      9 => 'add_game',
      10 => 'exit'
    }
  end

  def selected_option
    cases = methods_list
    loop do
      write_data('books', @list_add_book.books)
      write_data('labels', @list_add_book.labels)
      options
      choice = gets.chomp.to_i
      if choice == 10
        puts 'Thank you for using the app!'
        break
      end
      if choice >= 1 && choice < 10
        send(cases[choice])
      else
        puts 'Invalid option'
      end
    end
  end

  def list_music_albums
    @music_list.list_music
  end

  def list_genres
    @music_list.list_genre
  end

  def add_music_album
    @music_list.create_album
  end

  def list_books
    @list_add_book.list_books
  end

  def list_labels
    @list_add_book.list_labels
  end

  def add_book
    @list_add_book.add_book
  end
end
