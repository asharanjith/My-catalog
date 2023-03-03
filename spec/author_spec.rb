require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  it 'returns the correct items' do
    author = Author.new('Drake', 'Santos')
    expect(author.first_name).to eql 'Drake'
    expect(author.last_name).to eql 'Santos'
  end
end
