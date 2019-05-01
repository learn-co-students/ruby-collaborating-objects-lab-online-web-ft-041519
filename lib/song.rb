require "pry"

class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def new_by_filename(filename)
    song = Song.new
    puts "filename: #{filename}"
  end

end
