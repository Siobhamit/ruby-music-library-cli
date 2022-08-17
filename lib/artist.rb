class Artist
    attr_accessor :name, :songs

    extend Concerns::Findable
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end
    
    def add_song(song)
        song.artist=self unless song.artist
        self.songs.push(song) unless self.songs.include?(song)
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def genres
     self.songs.collect{|song| song.genre}.uniq
    end 

    def self.all
        @@all.sort_by!{|artist| artist.name}
        @@all
    end
    
    def save
        @@all.push(self)
    end
    
    def self.destroy_all
        @@all.clear
    end
    
    def self.create(name)
       artist = Artist.new(name)
       artist.save
       artist
    end
    
    
    end
    