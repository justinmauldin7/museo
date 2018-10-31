require './lib/artist'
require 'minitest/autorun'
require 'minitest/pride'

class ArtistTest < Minitest::Test

  def test_a_artist_exists
    attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist = Artist.new(attributes)
    assert_instance_of Artist, artist
  end
end
