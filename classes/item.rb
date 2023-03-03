require 'date'
require 'time'

class Item
  attr_accessor :genre, :author, :source, :label, :archived, :publish_date

  def initialize(publish_date, archived: false)
    @id = Random.rand(100_000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre=(genre)
    @genre = genre
    @genre.items = self
  end

  def add_author
    @author = author
  end

  def add_label
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Time.now.year - @publish_date.year > 10
  end
end
