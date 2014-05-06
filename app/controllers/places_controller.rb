class PlacesController < ApplicationController
  def show
    @places_and_visited_count = places_and_visited_count
  end

  private

  def places_and_visited_count
    places = Place.group(:name).count
    places_sorted = places.sort_by{ |place, visits| visits }.reverse!

    places_sorted.each do |place|
      place[2] = total_time_spent_in_place(place[0])
    end
  end

  def total_time_spent_in_place place_name
    total_duration = 0

    Place.where(name: place_name).each do |place|
      total_duration += place.duration.to_i
    end

    total_duration
  end
end
