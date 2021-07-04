require 'pry'
require_relative 'artist'
require_relative 'song'

class MP3Importer

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = Dir.foreach(path).select { |f| !File.directory?(f) }
  end

  def files
    @files
  end

  def import
    @files.each { |file| Song.new_by_filename(file) }
    #binding.pry
  end
end
