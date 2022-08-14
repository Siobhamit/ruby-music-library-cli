class Artist
    attr_accessor :name
    attr_reader :songs

    extend Concerns::Findable
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end
    
    def add_song(song)
        song.artist = self unless song.artist
        self.songs << song unless self.songs.include?(song)
    end
    
    def genres
     self.songs.collect{|song| song.genre}.uniq
    end 

    def songs
        @songs
    end
    
    
    def self.all
        @@all
    end
    
    def save
        @@all.push(self)
        self
    end
    
    def self.destroy_all
        @@all.clear
    end
    
    def self.create(name)
        Artist.new(name).save
    end
    
    
    end
    