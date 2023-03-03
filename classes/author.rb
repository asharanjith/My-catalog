class Author
  attr_reader :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = Random.rand(100_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end

  def to_json(*_args)
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name
    }.to_json
  end
end
