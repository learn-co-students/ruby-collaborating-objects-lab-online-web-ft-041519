require 'pry'

class Artist 
  attr_accessor :name, :songs  
  
  @@all = []
  
  def initialize(artist_name)
    @name = artist_name
    @songs = []
  end 
  
  def add_song(new_song)
    @songs << new_song
  end 
  
  def self.all
    @@all
  end 
  
  def save 
    @@all << self
  end 
  
  def self.find_by_name(artist_name)
    self.all.find{|x| x.name == artist_name}
  end 
  
  def self.create(artist_name) 
    artist = Artist.new(artist_name)
    artist.save 
    artist  
  end 
  
  def self.find_or_create_by_name(artist_name)
    self.find_by_name(artist_name) ? self.find_by_name(artist_name) : self.create(artist_name) 
  end 
  
  def print_songs
    puts @songs.collect{|x| x.name}
  end 
  
end 
