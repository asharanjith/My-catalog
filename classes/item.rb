class Item
  def initialize(publish_date, archived: false)
    attr_accessor :genre, :author, :source, :label, :archived, :publish_date

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

  def add_source
    @source = source
  end

  def add_label
    @label = label
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    publish_date > 10
  end
end
