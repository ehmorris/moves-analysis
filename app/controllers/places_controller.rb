class PlacesController < ApplicationController
  def show
    places_count = Place.group(:name).count
    places_sorted = places_count.sort_by{ |place, visits| visits }.reverse!

    @places_and_visited_count = places_sorted
  end
end
