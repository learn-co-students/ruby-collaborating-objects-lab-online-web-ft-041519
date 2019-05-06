require "pry"

class MP3Importer

  @@filepathDirectory = []

  attr_accessor :filepath,

  def initialize(filepath)
    @filepath = filepath
    @@filepathDirectory << filepath
  end

  def files
    @files = Dir.glob(".spec/fixtures/mp3s/*.mp3")
  end

  def import(filename)
    self.new_by_filename(filename)
  end

end
