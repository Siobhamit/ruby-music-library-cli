class MusicLibraryController

def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
    # @songs = []
    # Song.all.each{|song| @songs.push(song)}
    # @songs = songs
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
        self.list_songs_by_artist
    when 'list genre' 
        g = gets.chomp 
        self.list_songs_by_genre
    when 'play song' 
        s = gets.chomp
        self.play_song
    else
    self.call unless gets.chomp == 'exit'
    end
end

def list_songs
    index=0
    Song.all.sort{ |a, b| a.name <=> b.name }.each do |s|
              puts "#{index}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
              index+=1
    end
  end


# def list_songs
#    Song.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |song, index| 
#     puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
# end
# end

def list_artists
        Artist.all.sort{|a, b| a.name <=> b.name}.each.with_index(0) do |a, i|
          puts "#{i}. #{a.name}"
        end
      end
    # a = self.songs.sort_by!{|song| song.artist.name}
    # a.each_with_index do |object, index| i=index+1
    #     puts "#{i}. #{object.artist.name}"
    #   end

def list_genres
    self.songs.collect{|song| song.genre.name}.sort!.each_with_index { |n, i| puts "#{i+1}. #{n}"}
end

def list_songs_by_artist
    self.songs.collect{|song| song.artist.name == a}.sort!.each_with_index { |n, i| puts "#{i+1}. #{n}"}
end

def list_songs_by_genre
    self.songs.collect{|song| song.genre.name == g}.sort.each_with_index { |n, i| puts "#{i+1}. #{n}"}
end


def play_song
    self.songs.select{|song| song.name == s}.open
end

end