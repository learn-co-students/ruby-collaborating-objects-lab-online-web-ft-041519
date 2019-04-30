require "pry"

class Artist

  @@all = []

  attr_accessor :name, :song

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song = Song.new
    @songs << song
  end

  def save
    @@all << self
  end

  def all
    @@all
  end

  def find_or_create_by_name(name)
binding.pry
    if @@all.find{|artist| artist.name == name}
      @@all.find{|artist| artist.name == name}
    else
      Artist.new(name)
    end
  end

  def print_songs
    @songs
  end

end
