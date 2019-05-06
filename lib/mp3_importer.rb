require 'pry'


class MP3Importer
  
  attr_accessor :path
  
  def initialize(path)
    #accepts a file path to parse mp3 files from (FAILED - 8)
    @path = path
  end
  
  def path
    @path
  end
    
  def files
    #loads all the mp3 files in the path directory (FAILED - 9)
    #normalizes the filename to just the mp3 filename with no path (FAILED - 10)
    @files = Dir.glob("#{@path}/*.mp3").map { |file| file.gsub("#{@path}/", "") }
    
    #OR
    # @files = Dir.entries("./spec/fixtures/mp3s")
    # @files.delete_if { |i| i == "." || i ==".."}
  end
  
  def import
    #imports the files into the library by creating songs from a filename (FAILED - 11)
    self.files.each { |filename| Song.new_by_filename(filename) }
  end
  
end

