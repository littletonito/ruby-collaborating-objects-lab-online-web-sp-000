
class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  # def save
  #   @@all << self
  # end

  def self.all
    @@all
  end

  def add_song(song)
    # receives an instance of a Song and associates it belongs to this Artist instance.
    song.artist = self
  end

  def songs
    # returns an Array of all songs that belong to this Artist instance.
    # should get all existing Song instances from Song and select only the ones that are associated with this Artist instance.
    Song.all.select do |song|
      song.artist == self
    end
  end

  def self.find_or_create_by_name(name)
    # Find the artist instance that has that name or create one if it doesn't exist
    if self.find(name)
      self.find(name)
    else
      self.new(name)
    end
  end

  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end

  def print_songs
    # outputs the names of all songs associated with this Artist instance.
    songs.each do |song|
      puts song.name
    end
  end

end
