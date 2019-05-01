require "pry"

class Artist

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    new_song = Song.new(song.name)
    @songs << new_song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def find_or_create_by_name(name)
binding.pry
    if @@all.any? { |artist| artist.name == name }
      @@all.find { |artist| artist.name == name }
    else
      Artist.new(name)
    end
  end

  def print_songs
    @songs
  end

end
