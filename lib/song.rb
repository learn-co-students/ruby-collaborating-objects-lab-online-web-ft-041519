require 'pry'

class Song 
  attr_accessor :name, :artist
  
  def initialize(name)
    @name = name
  end
  
  def self.new_by_filename(file_name)
    split_name = file_name.split(" - ")
    song = self.new(split_name[1])
    song.artist = Artist.find_or_create_by_name(split_name[0])
    song.artist.add_song(song)
    song
   # binding.pry
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  
end