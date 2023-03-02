require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date, :id

  def initialize(publish_date, on_spotify, id: Random.rand(100_000))
    super(publish_date)
    @on_spotify = on_spotify
    @id = id
    @publish_date = publish_date
  end

  def can_be_archived?
    super && @on_spotify == true
  end
end
