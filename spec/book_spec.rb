require_relative '../classes/book'

describe Book do
  context 'when the book is published in 2018' do
    it 'When a book is added, it create an instance of Book' do
      book = Book.new('2018', 'publisher', 'good')
      expect(book).to be_an_instance_of(Book)
    end
    it 'When a book is added, it has a publisher' do
      book = Book.new('2018', 'publisher', 'good')
      expect(book.publisher).to eq('publisher')
    end
    it 'When a book is added, it has a cover state' do
      book = Book.new('2018', 'publisher', 'good')
      expect(book.cover_state).to eq('good')
    end
    it 'When a book is added, it has a publish date' do
      book = Book.new('2018', 'publisher', 'good')
      expect(book.publish_date).to eq('2018')
    end
  end
end
