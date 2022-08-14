class MusicImporter
    
    attr_accessor :path, :files, :artist, :song, :genre


    def initialize(path)
        @files = []
        @path = path
    end

    def path
        @path
    end

    def files
    Dir[self.path].each {|file| require file }.map{ |file| self.files << file.basename }
    end

    def self.import
        @files.map{|file| Song.new_from_filename(file)}
    end





end
