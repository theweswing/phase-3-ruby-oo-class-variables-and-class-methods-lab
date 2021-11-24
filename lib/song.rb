require 'pry'

class Song
  @@count = 0
  @@artists = []
  @@genres = []
  @@all = []

  attr_accessor :name
  attr_accessor :artist
  attr_accessor :genre

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    @@artists << artist
    @@genres << genre
    @@all << self
    @@count = @@count + 1
  end

  def self.count
    @@count
  end

  def self.genres
    no_dupes = @@genres.uniq
    no_dupes
  end

  def self.artists
    no_dupes = @@artists.uniq
    no_dupes
  end

  def self.genre_count
    genre_list = self.genres
    genre_count = {}
    genre_list.each do |given_genre|
      genre_count = { **genre_count, "#{given_genre}" => 0 }
    end
    @@genres.each do |given_genre|
      genre_count = {
        **genre_count,
        "#{given_genre}" => genre_count["#{given_genre}"] + 1,
      }
    end
    genre_count
  end

  def self.artist_count
    artist_list = self.artists
    artist_count = {}
    artist_list.each do |given_artist|
      artist_count = { **artist_count, "#{given_artist}" => 0 }
    end
    @@artists.each do |given_artist|
      artist_count = {
        **artist_count,
        "#{given_artist}" => artist_count["#{given_artist}"] + 1,
      }
    end
    artist_count
  end
end
