require_relative '../classes/book'

describe Book do
  before :each do
    @book = Book.new('2020-01-01', 'Publisher', 'good')
  end

  describe '#initialize' do
    it 'creates a new book' do
      expect(book).to be_an_instance_of(Book)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the book can be archived' do
      expect(book.can_be_archived?).to be(true)
    end
  end

  it 'should return publisher' do
    expect(@book.publisher).to eq('Publisher')
  end

  it 'should return cover_state' do
    expect(@book.cover_state).to eq('good')
  end
end
