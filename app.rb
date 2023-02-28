class App
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
end
