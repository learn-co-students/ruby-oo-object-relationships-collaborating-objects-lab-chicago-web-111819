class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        return @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select { |song| song.artist == self }
    end

    def self.find_or_create_by_name(artist_name)
        if self.artist_names.include?(artist_name)
            artist = self.find_artist_by_name(artist_name) 
        else
            artist = Artist.new(artist_name)
        end
    end

    def print_songs
        songs.each { |song| puts song.name }
    end

    # === helper methods ===
    private
        def self.artist_names
            self.all.collect { |artist| artist.name }
        end

        def self.find_artist_by_name(artist_name)
            self.all.each do |artist|
                if artist.name == artist_name
                    return artist
                end
            end
        end


end