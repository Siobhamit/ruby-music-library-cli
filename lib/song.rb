class Song
    attr_accessor :name
    attr_reader :artist, :genre
   
 
    @@all = []
    
    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist=(artist) if artist
        self.genre=(genre) if genre
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
    end
    
    def self.destroy_all
        @@all.clear
    end
    
    def self.create(name)
        song = Song.new(name)
        song.save
        song
    end

    def self.find_by_name(name)
        self.all.select{|a| a.name == name}.at(0)
     end
 
 
     def self.find_or_create_by_name(name)
            if self.find_by_name(name)
               self.find_by_name(name)
            else self.create(name)
            end
            end

     def self.new_from_filename(filename)
     a = filename.split(/ - /, 3)
     name = a[1]
     a[2].delete! ".mp3"
     song = Song.find_or_create_by_name(name)
     song.artist= Artist.find_or_create_by_name(a[0])
     song.genre= Genre.find_or_create_by_name(a[2])
     song
     end

     def self.create_from_filename(filename)
        self.new_from_filename(filename).save
     end

end