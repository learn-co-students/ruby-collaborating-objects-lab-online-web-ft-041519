require_relative 'song'
require_relative 'artist'
require_relative 'mp3_importer'

#puts Artist.all
#puts "all artists"

#new_mp3 = MP3Importer.new("./spec/fixtures/mp3s/")
#puts new_mp3.files
#puts Song.new_by_filename("Action Bronson - Larry Csonka - indie.mp3")

song = Song.new_by_filename('Michael Jackson - Black or White - pop.mp3')
puts song.artist
puts Artist.all
puts Artist.all.first
puts Artist.all.first.songs

binding.pry
