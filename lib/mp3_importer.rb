require 'pry'
class MP3Importer
  attr_accessor :path
  @@array = []
  def initialize(path)
    @path = path
  end

  def files

    new_path = @path + "/*"
    Dir[new_path].each do |song|
      track = song.split(/3s\//).pop
      @@array << track
    end
    @@array
  end
  #["./spec/fixtures/mp3s/Real Estate - Green Aisles - country.mp3",
  #"./spec/fixtures/mp3s/Real Estate - It's Real - hip-hop.mp3",
  #"./spec/fixtures/mp3s/Action Bronson - Larry Csonka - indie.mp3",
  #"./spec/fixtures/mp3s/Thundercat - For Love I Come - dance.mp3"]
  def import
    @@array.each do |song|
      new_song = Song.new_by_filename(song)
    end
  end
end
