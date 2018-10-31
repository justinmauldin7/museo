require './lib/curator'
require './lib/photograph'
require './lib/artist'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class CuratorTest < Minitest::Test

  def test_a_curator_exists
    curator = Curator.new
    assert_instance_of Curator, curator
  end

  def test_a_curator_has_attributes
    curator = Curator.new
    assert_equal [], curator.artists
    assert_equal [], curator.photographs
  end

  def test_a_curator_can_add_photographs
    curator = Curator.new
    attributes_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    attributes_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    photo_1 = Photograph.new(attributes_1)
    photo_2 = Photograph.new(attributes_2)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    assert_equal [photo_1, photo_2], curator.photographs
    assert_equal photo_1, curator.photographs.first
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", curator.photographs.first.name
  end

  def test_a_curator_can_add_artists
    curator = Curator.new
    attributes_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    attributes_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist_1 = Artist.new(attributes_1)
    artist_2 = Artist.new(attributes_2)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    assert_equal [artist_1, artist_2], curator.artists
    assert_equal artist_1, curator.artists.first
    assert_equal "Henri Cartier-Bresson", curator.artists.first.name
  end

  def test_a_curator_can_add_artists_and_photograph_by_id
    curator = Curator.new
    data_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    data_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    photo_1 = Photograph.new(data_1)
    photo_2 = Photograph.new(data_2)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    attributes_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    attributes_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist_1 = Artist.new(attributes_1)
    artist_2 = Artist.new(attributes_2)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    assert_equal artist_1, curator.find_artist_by_id("1")
    assert_equal photo_2, curator.find_photograph_by_id("2")
  end

  def test_a_curator_can_Find_photographs_by_artist
    curator = Curator.new
    data_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    data_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    data_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    data_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }
    photo_1 = Photograph.new(data_1)
    photo_2 = Photograph.new(data_2)
    photo_3 = Photograph.new(data_3)
    photo_4 = Photograph.new(data_4)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    attributes_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    attributes_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    attributes_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }
    artist_1 = Artist.new(attributes_1)
    artist_2 = Artist.new(attributes_2)
    artist_3 = Artist.new(attributes_3)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)
    diane_arbus = curator.find_artist_by_id("3")
    assert_equal [photo_3, photo_4], curator.find_photographs_by_artist(diane_arbus)
    # assert_equal [artist_3], curator.artists_with_multiple_photographs
  end

  def test_a_curator_can_Find_photographs_by_country
    curator = Curator.new
    data_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    data_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    data_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    data_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }
    photo_1 = Photograph.new(data_1)
    photo_2 = Photograph.new(data_2)
    photo_3 = Photograph.new(data_3)
    photo_4 = Photograph.new(data_4)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    attributes_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    attributes_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    attributes_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }
    artist_1 = Artist.new(attributes_1)
    artist_2 = Artist.new(attributes_2)
    artist_3 = Artist.new(attributes_3)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)
    # assert_equal [photo_2, photo_3, photo_4], curator.photographs_taken_by_artists_from("Argentina")
    # assert_equal [], curator.photographs_taken_by_artists_from("United States")
  end
end
