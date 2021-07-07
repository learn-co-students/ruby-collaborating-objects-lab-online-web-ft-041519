class Song 
  
  attr_accessor :name, :artist 
  
  @@all = []
  
  def initialize(name) 
    @name = name
    @artist = []
  end 
  
  def save 
    @@all << self
  end 
  
  def self.all
    @@all
  end 
  
  def self.new_by_filename(file_name)
    song_1 = self.create(file_name.split(" - ")[1])
    artist_1 = Artist.create(file_name.split(" - ")[0])
    song_1.artist = artist_1
    Artist.all.first.songs = song_1.name 
    song_1
  end 

  def self.create(song_name) 
    song = Song.new(song_name)
    song.save 
    song  
  end 
  
end 