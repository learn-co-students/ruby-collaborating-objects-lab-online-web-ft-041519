require 'pry'
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

    def self.new_by_filename(filename)
      artist, song = filename.split(" - ")
      new_artist = Artist.new(artist)
      new_artist.save
      new_song = Song.new(song)
      new_song.artist = new_artist
      new_artist.add_song(new_song)
      new_song
    end
end
