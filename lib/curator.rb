class Curator
  attr_reader :artists,
              :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photo|
      photo.id == id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      photo.artist_id == artist.id
    end
  end

  def artists_with_multiple_photographs
    # all_artist_ids = @photographs.map do |photo|
    #   photo.artist_id
    # end
    #binding.pry
    # all_artist_ids.find_all do |id|
    #   id

    #this obviously is not working yet.
  end

  def artist_by_country
    @artis
  end

  def photographs_taken_by_artists_from(country)
    # @photographs.find_all do |photo|
    #   binding.pry
    #   if photo.artist_id == artist.id
    #     artist.country
    #   else
    #   end
    # end

    #this is not working yet either. I am pretty
    #sure I need some helper methods somehwere
    #but ran out of time to try and figureout how to get this to work
  end

end
