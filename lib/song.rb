require 'pry'
class Song
  attr_accessor :name
  @@all =[]

def initialize(name)
  @name = name
  @all << self
  end

def self_new_by_filename(name)
  
end
def self.all? 
  @@all
end 




