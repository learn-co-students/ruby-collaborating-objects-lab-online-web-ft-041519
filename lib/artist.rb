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
<<<<<<< HEAD
    puts @songs.collect{|x| x.name}
  end 
  
end 
=======
    @songs.collect{|x| x.name}
    binding.pry
  end 
  
end 

describe 'Artist' do
  let(:artist) {Artist.new('Michael Jackson')}

  describe '#print_songs' do
    it 'lists all of the artist\'s songs' do
      dirty_diana = Song.new("Dirty Diana")
      billie_jean = Song.new("Billie Jean")
      artist.add_song(dirty_diana)
      artist.add_song(billie_jean)
      binding.pry
      expect{artist.print_songs}.to output("Dirty Diana\nBillie Jean\n").to_stdout
    end
  end
end
>>>>>>> 620976468c47f3882685c93cb78ff74788d20ea9
