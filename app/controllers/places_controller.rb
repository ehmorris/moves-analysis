class PlacesController < ApplicationController
  def show
    @places = places_and_visited_count
    @places.each do |place|
      place[2] = total_time_spent_in_place(place[0])
      place[3] = median_time_spent_in_place(place[0])
      place[4] = average_time_spent_in_place(place[0])
    end
  end

  private

  def places_and_visited_count
    places_and_visited_count = Place.group(:name).count
    places_and_visited_count_sorted = places_and_visited_count
      .sort_by{ |place, visits| visits }.reverse!
  end

  def total_time_spent_in_place place_name
    total_duration = 0

    Place.where(name: place_name).each do |place|
      total_duration += place.duration.to_i
    end

    total_duration
  end

  def median_time_spent_in_place place_name
    all_durations = array_of_all_durations(place_name).sort
    len = all_durations.length
    (all_durations[(len - 1) / 2] + all_durations[len / 2]) / 2.0
  end

  def average_time_spent_in_place place_name
    all_durations = array_of_all_durations(place_name)
    all_durations.inject{ |sum, el| sum + el }.to_f / all_durations.size
  end

  def array_of_all_durations place_name
    all_durations = []

    Place.where(name: place_name).each do |place|
      all_durations.push place.duration.to_i
    end

    all_durations
  end
end
