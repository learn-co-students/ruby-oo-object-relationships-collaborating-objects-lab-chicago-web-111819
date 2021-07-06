class MP3Importer
    attr_reader :path

    def initialize(folder_path)
        @path = folder_path
    end

    def files
        mp3_file_paths = Dir[self.path + "/*.mp3"]
        mp3_file_paths.collect { |p| p.split("/")[4] }
    end

    def import
        self.files.each { |file_name| Song.new_by_filename(file_name) }
    end

end


