class Song
    attr_accessor :name
    attr_reader :artist, :genre
   
 
    @@all = []
    
    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist=(artist) if artist
        self.genre=(genre) if genre
        @@all << self
        self
    end
    
    def self.all
        @@all
    end
    
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
      end

      def genre=(genre)
        @genre = genre
        genre.songs.push(self) unless genre.songs.include?(self)
      end

    def save
        @@all.push(self)
        self
    end
    
    def self.destroy_all
        @@all.clear
    end
    
    def self.create(name)
        Song.new(name).save
    end

    def self.find_by_name(name)
        self.all.select{|a| a.name == name}.at(0)
     end
 
 
     def self.find_or_create_by_name(name)
        self.create(name) unless self.find_by_name(name)
     end

end