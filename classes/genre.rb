require_relative './item'

class Genre < Item
  attr_reader :id
  attr_accessor :name, :items

  def initialize(publish_date, name)
    super(publish_date)
    @id = Random.rand(100_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
