require_relative './item'

class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name, id: Random.rand(100_000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
