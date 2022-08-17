class MusicLibraryController
    attr_reader :song, :artist, :genre
    attr_accessor :songs

def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
    @songs = []
    Song.all.each{|song| @songs.push(song)}
    @songs = songs
end

def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.chomp 
    case input
    when 'list songs'
        self.list_songs
    when 'list artists' 
        self.list_artists
    when 'list genres' 
        self.list_genres
    when 'list artist' 
        a = gets.chomp 
        self.list_songs_by_artist(a)
    when 'list genre' 
        g = gets.chomp 
        self.list_songs_by_genre(g)
    when 'play song' 
        s = gets.chomp
        self.play_song(s)
    else
    self.call unless gets.chomp == 'exit'
    end
end


def list_songs
    i = 0
   a = self.songs.collect{|song| song.name}.sort!
   a.each{|song| i+=1
    puts "#{i}. #{song.artist.name} - #{songname} - #{song.genre.name}"} 
end

def list_artists
    a = self.songs.sort_by!{|song| song.artist.name}
    a.each_with_index do |object, index|
        puts "#{index}. #{object.artist.name}"
      end
end

def list_genres
    self.songs.collect{|song| song.genre.name}.sort!.each_with_index { |n, i| puts "#{i+1}. #{n}"}
end

def list_songs_by_artist(a)
    self.songs.collect{|songs| song.artist.name == a}.sort!.each_with_index { |n, i| puts "#{i+1}. #{n}"}
end

def list_songs_by_genre(g)
    self.songs.collect{|songs| song.genre.name == g}.sort.each_with_index { |n, i| puts "#{i+1}. #{n}"}
end


def play_song(s)
    self.songs.select{|song| song.name == s}.open
end

end