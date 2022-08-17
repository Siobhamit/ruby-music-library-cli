class MusicImporter
    attr_accessor :path, :files


    def initialize(path)
        @files = []
        @path = path
    end


    def files
        a = Dir.new self.path
        mp3s = a.entries
        mp3s.entries.each{|file| @files.push(file)}
    @files.delete(".")
    @files.delete("..")
    @files
end

    def import
        self.files.each{|filename| Song.create_from_filename(filename)}
    end



end
