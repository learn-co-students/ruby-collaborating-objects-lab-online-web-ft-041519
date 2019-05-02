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
    #binding.pry
    self.find_by_name(artist_name) ? self.find_by_name(artist_name) : self.create(artist_name) 
  end 
  
end 

describe 'Artist' do
  let(:artist) {Artist.new('Michael Jackson')}

  describe '.find_or_create_by_name' do
    it 'finds or creates an artist by name maintaining uniqueness of objects by name property' do
      artist_1 = Artist.find_or_create_by_name("Michael Jackson")
      artist_2 = Artist.find_or_create_by_name("Michael Jackson")
      expect(artist_1).to eq(artist_2)
    end

    it 'Creates new instance of Artist if none exist' do
      artist_1 = Artist.find_or_create_by_name("Drake")
      expect(artist_1.class).to eq(Artist)
    end
  end

  describe '#print_songs' do
    it 'lists all of the artist\'s songs' do
      dirty_diana = Song.new("Dirty Diana")
      billie_jean = Song.new("Billie Jean")
      artist.add_song(dirty_diana)
      artist.add_song(billie_jean)
      expect{artist.print_songs}.to output("Dirty Diana\nBillie Jean\n").to_stdout
    end
  end
end
