#class Artist 
  # def self.create(name)
  #   artist = self.new(name)     
  #   artist.name = name 
  #   artist 
  # end 
  
  # def self.find(name)
  #   self.all.find {|artist| artist.name == name}                                                            
  # end
    
  
  def self.find_or_create_by_name(name)
      self.all.find {|artist| Artist.name == name} || self.new(name).save
      # self.find(name) ? self.find(name) : self.create(name)
      #binding.pry 
  end 
  
  def print_songs 
     songs.each {|song| puts song.title}
  end 
  
  
  ----
  #class Song
  
  def self.new_by_filename(filename)
    # song = self.new 
    song.title = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    song = self.new(title)
    song.artist = artist
    song 
  end 
  
  def artist_name  
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end 
  
  ----
  #Class Mp3
  
  def files
    files = []
    Dir.entries(path).select {entry.include?("mp3")}
  end 
  
   def import(list_of_filenames)
    list_of_filenames.each {|filename| Song.new_by_filename(filename)}
  end 
  