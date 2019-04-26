require 'pry'

class Artist 
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    @songs << song 
    song.artist = self
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self 
  end
  
  def print_songs
    songs.each {|song| puts song.name}
  end
    
  def self.find_or_create_by_name(artist_name)
    self.all.each do |artist|
      if artist.name == artist_name
        return artist
      else
        return Artist.new(artist_name)
      end
    end
  end
        
  
  #  self.all.find {|artist| artist.name == artist_name} || Artist.new(artist_name)
   # binding.pry
  
  
end