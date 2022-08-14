class Genre
    attr_accessor :name
    attr_reader :songs, :artists

    extend Concerns::Findable
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def artists
     self.songs.collect{|song| song.artist}.uniq
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
        Genre.new(name).save
    end
    
    
    end