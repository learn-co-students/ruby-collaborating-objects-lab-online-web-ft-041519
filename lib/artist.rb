require_relative 'song'

class Artist
  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(name)
    if !self.all.find { |artist| artist.name == name }
      self.new(name)
    else
      self.all.find { |artist| artist.name == name }
    end
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end
end
