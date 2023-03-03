require_relative '../classes/game'
require_relative '../classes/item'
require 'date'

describe Game do
  it 'returns the correct items' do
    game = Game.new('player', '01/01/2022', '01/01/2023')
    expect(game.multiplayer).to eql 'player'
    expect(game.last_played_at).to eql '01/01/2022'
    expect(game.publish_date).to eql '01/01/2023'
  end
end
