require_relative 'artist'

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        # format: "Artist name - Song name"
        song_artist = file_name.split(" - ")
        art_name = song_artist[0]
        song_name = song_artist[1]

        new_song = self.new(song_name)
        new_song.artist_name = art_name

        return new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        self.artist.add_song(self)
    end

end