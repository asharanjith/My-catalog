require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :id

  def initialize(multiplayer, last_played_at, publish_date, archived: false)
    super(publish_date)
    @id = Random.rand(100_000)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && Date.strptime(@last_played_at, '%Y-%m-%d') < DateTime.now.prev_year(2)
  end

  def to_json(*_args)
    {
      id: @id,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      publish_date: @publish_date,
      archived: @archived
    }.to_json
  end
end
