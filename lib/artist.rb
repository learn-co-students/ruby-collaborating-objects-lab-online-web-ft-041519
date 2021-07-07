require 'pry'
class Artist
  attr_accessor :name, :songs

  @@all = []
  @@names = []
  def initialize(name)
    @name = name
    @songs = []
    @@names << name
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def save
    @@all << self
    #binding.pry
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if @@names.include?(name) == false
      artist = Artist.new(name)
      artist.save
    end
    artist

  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

end
