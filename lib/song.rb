class Song 
  attr_accessor :name, :artist 

  def initialize(name) 
    @name = name 
    @@artist = artist 
  end 

  def self.new_by_filename(filename)                  #revised 
    song_name = filename.split(" - ")[1]
    artistname = filename.split(" - ")[0]
    song = self.new(song_name)
    song.artist_name = artistname  
    song 
  end 
  
  def artist_name=(name)
    self.artist= Artist.find_or_create_by_name(name)        #revised 
    self.artist.add_song(self)
  end 
  
end 