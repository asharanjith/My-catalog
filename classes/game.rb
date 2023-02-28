require_relative './item'

class Game < Item
  attr_accessor :mulitiplayer, :last_played_at

 def initialize(mulitiplayer, last_played_at, publish_date, _id, archived: false)
    super(publish_date, archived)
    @mulitiplayer = mulitiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    item_caller = Item.new
    return false unless item_caller.can_be_archived? == true &&  Date.strptime(@last_played_at, '%Y-%m-%d') < DateTime.now.prev_year(2)
  end
end