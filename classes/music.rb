require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date, _id, archived: false)
    super(publish_date, archived: false)
    @on_spotify = on_spotify
    @archived = archived
  end

  def can_be_archived?
    item_caller = Item.new
    return false unless item_caller.can_be_archived? == true && on_spotify == true
  end
end
