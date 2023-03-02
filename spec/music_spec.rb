require_relative '../classes/music'
require_relative '../classes/item'
require 'date'

describe MusicAlbum do
  it 'Should create an instance of the MusicAlbum class' do
    date = Date.parse '2023/03/10'
    musicalbum = MusicAlbum.new(true, date)
    expect(musicalbum).to be_instance_of MusicAlbum
  end

  it 'Should return the same data and return false' do
    musicalbum = MusicAlbum.new('2023/03/01', true)
    expect(musicalbum.publish_date).to eq('2023/03/01')
    expect(musicalbum.archived).to be false
  end
end
