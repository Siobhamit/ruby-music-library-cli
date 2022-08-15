class MusicImporter
    attr_accessor :path, :files


    def initialize(path)
        @files = []
        @path = path
    end


    def files
        Dir.entries(self.path) do |dir|
            dir.each do |file|
                self.files.push(file).uniq!
            end
        end
    end

    def import
        filenames = self.files.map{|file| file.basename(file, ".mp3")}
        filenames.each{|filename| Song.create_from_filename(filename)}
    end





end
