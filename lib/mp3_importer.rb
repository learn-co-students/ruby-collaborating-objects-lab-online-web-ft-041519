require "pry"

class MP3Importer

  @@filepathDirectory = []

  attr_accessor :filepath,

  def initialize(filepath)
    @filepath = filepath
    @@filepathDirectory << filepath
  end

  def files
    @@filepathDirectory
  end

  def import(filename)
    self.new_by_filename(filename)
  end

end
