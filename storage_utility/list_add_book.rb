require_relative '../classes/book'
require_relative '../classes/label'
require 'json'

class ListAddBook
  attr_accessor :books, :labels

  def initialize
    base_path = "#{Dir.pwd}/json_files"

    @books = []
    books_json = File.read("#{base_path}/books.json")
    unless books_json.empty?
      JSON.parse(books_json).each do |book|
        @books.push(Book.new(book['publish_date'], book['publisher'], book['cover_state']))
      end
    end
    @labels = []
    labels_json = File.read("#{base_path}/labels.json")
    return if labels_json.empty?

    JSON.parse(labels_json).each do |label|
      @labels.push(Label.new(label['title'], label['color']))
    end
  end

  def add_book
    print 'Enter the book you want to add : '
    title = gets.chomp
    print 'Enter the color of the book : '
    color = gets.chomp
    print 'Enter the publish date of the book(yyyy/mm/dd) : '
    publish_date = gets.chomp
    print 'Enter the publisher of the book : '
    publisher = gets.chomp
    print 'Enter the cover state of the book : '
    cover_state = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    label = Label.new(title, color)
    @books.push(book)
    @labels.push(label)
    puts 'Book added'
  end

  def list_books
    if @books.empty?
      puts 'No books in the library'
    else
      @books.each do |book|
        puts "Publish date: #{book.publish_date}, Publisher: #{book.publisher}, Cover state: #{book.cover_state}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts 'No labels in the library'
    else
      @labels.each do |label|
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end
end
