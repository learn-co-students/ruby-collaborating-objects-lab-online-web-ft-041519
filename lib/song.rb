# From spec 
#   let(:song) {Song.new('Man in the Mirror')}
#   let(:file_name) {'Michael Jackson - Black or White - pop.mp3'}


class Song
  
  attr_accessor :name, :artist
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.new_by_filename(filename)
    #creates a new instance of a song from the file that's passed (FAILED - 15)
    #associates new song instance with the artist from the filename (FAILED - 16)
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    song = Song.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.artist.add_song(song)
    song
  end
  
end