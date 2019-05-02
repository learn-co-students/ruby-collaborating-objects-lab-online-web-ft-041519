require 'pry'

class MP3Importer 
  
  attr_accessor :path, :files
  
  def initialize(test_music_path)   
    @path = test_music_path
  end
  
  def files
    @files = Dir.glob("#{path}/*.mp3").collect!{|x| x.sub("#{path}/","")}
  end 
  
  def import 
    files.collect do |x|    
      Song.new_by_filename(x)
    end 
  end 
  
end 
