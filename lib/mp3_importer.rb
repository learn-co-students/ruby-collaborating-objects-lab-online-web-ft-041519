require 'pry'

class MP3Importer
  attr_accessor :path 
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.entries(path).select {|entry| entry.include?("mp3")}
  end 
  
  def import 
    files.each {|x| Song.new_by_filename(x)}
  end
  
end