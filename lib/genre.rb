class Genre
    attr_accessor :name, :songs

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
        Song.all.select{|song| song.genre == self}
    end
    
    def self.all
        @@all
    end

    def save
        @@all.push(self)
    end
    
    def self.destroy_all
        @@all.clear
    end
    
    def self.create(name)
        genre = Genre.new(name)
        genre.save
        genre
    end
    
    
    end