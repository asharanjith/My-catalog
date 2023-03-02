require 'fileutils'
require 'json'

FileUtils.mkdir_p('json_files')
base_path = "#{Dir.pwd}/json_files"

File.open("#{base_path}/books.json", 'w') unless File.exist?("#{base_path}/books.json")
File.open("#{base_path}/labels.json", 'w') unless File.exist?("#{base_path}/labels.json")


def write_data(file, data)
  case file
  when 'books'
    write_book(data)
  when 'labels'
    write_label(data)
  end
end

def write_book(data)
  book_data_holder = []
  data.each do |book|
    book_data_holder.push(
      {
        publish_date: book.publish_date,
        publisher: book.publisher,
        cover_state: book.cover_state
      }
    )
  end
  File.write("#{Dir.pwd}/json_files/books.json", book_data_holder.to_json, mode: 'w')
end

def write_label(data)
  label_data_holder = []
  data.each do |book|
    label_data_holder.push(
      {
        title: book.title,
        color: book.color
      }
    )
  end
  File.write("#{Dir.pwd}/json_files/labels.json", label_data_holder.to_json, mode: 'w')
end
