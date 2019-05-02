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
    #binding.pry
    @files.collect do |x|    
      Song.new_by_filename(x)
    end 
  end 
  
end 

describe "MP3Importer" do

  describe '#import' do
    it 'imports the files into the library by creating songs from a filename' do
      test_music_path = "./spec/fixtures/mp3s"
      music_importer = MP3Importer.new(test_music_path)
      #binding.pry
      expect(Song).to receive(:new_by_filename).at_least(4).times
      music_importer.import
    end
  end
end
