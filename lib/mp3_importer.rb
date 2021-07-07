require 'pry'

class MP3Importer
  
  attr_accessor :path 
  
  def initialize(path)
    @path = path 
  end
  
  def files 
    #binding.pry 
    @files ||= Dir.glob("#{path}/*.mp3").collect {|f| f.gsub("#{path}/", "")}
  end 
  
  def import 
    #binding.pry 
    files.each {|f| Song.new_by_filename(f)} 
  end 
  
end 