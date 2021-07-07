require 'pry'
class Artist 
  attr_accessor :name, :songs  

  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end 
  
  def add_song(song)    #revised
    @songs << song 
  end 
  
  def self.all  
     @@all 
  end 
  
  def save
    @@all << self     #revised 
    self 
  end 
    
  def self.find_or_create_by_name(name)
      self.all.find {|artist| artist.name == name} || self.new(name).save           #revised 
      # self.all.each do |artist|
      #   if artist.name == name
      #     return artist
      #   else
      #     return Artist.new(name)
      #   end
      # end
  end
  
  def print_songs 
     songs.each {|song| puts song.name}
  end 
  
end 
