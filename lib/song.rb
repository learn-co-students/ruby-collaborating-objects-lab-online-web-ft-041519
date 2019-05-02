class Song 
  
  attr_accessor :name, :artist 
  
  @@all = []
  
  def initialize(name) 
    @name = name
    @artist = []
  end 
  
  def save 
    @@all << self
  end 
  
  def self.all
    @@all
  end 
  
  def self.new_by_filename(file_name)
    song_1 = self.create(file_name.split(" - ")[1])
    artist_1 = Artist.create(file_name.split(" - ")[0])
    song_1.artist = artist_1
    Artist.all.first.songs = song_1.name 
    song_1
  end 

  def self.create(song_name) 
    song = Song.new(song_name)
    song.save 
    song  
  end 
  
end 

describe 'Song' do
  let(:song) {Song.new('Man in the Mirror')}
  let(:file_name) {'Michael Jackson - Black or White - pop.mp3'}

  describe '.new_by_filename' do
    it 'creates a new instance of a song from the file that\'s passed' do
      new_instance = Song.new_by_filename(file_name)
      expect(new_instance.name).to eq('Black or White')
    end

    it 'associates new song instance with the artist from the filename' do
      Artist.class_variable_set("@@all",[])
      new_instance = Song.new_by_filename(file_name)
      expect(new_instance.artist.name).to eq('Michael Jackson')
      expect(Artist.all.size).to eq(1)
      expect(Artist.all.first.songs.empty?).to eq(false)
    end
  end
end
