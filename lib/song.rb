class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file_name)
# It must parse a filename to find the song name and artist name. (Hint: every file separates the song and artist with a " - ").
# From here, we will create a new song instance using the string we gathered from the filename.
# We'll also want to associate that new song with an artist. Use the artist attribute accessor to assign this
# Return the new song instance.
    artist, song = file_name.split(" - ")
    new_song = Song.new(song)
    new_song.artist_name = artist
    new_song
  end

  def artist_name=(name)
# Turn the artist's name as a string into an Artist object
# First we need to get the instance of the Artist class that represents that artist. There are two possibilities here:
#      1) Either we have to create that Artist instance
#      2) Or it already exists and we have to find that Artist instance.
# So we'll need to collaborate with the Artist class. We want to send an artist's name (a string--from the parsed filename)
# to the Artist class to get the functionality in #1 and #2. We use method Artist.find_or_create_by_name.
# Assign the song to the artist (Since an artist has many songs, we'll want to make this association)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

end
