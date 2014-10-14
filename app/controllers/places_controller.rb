class PlacesController < ApplicationController
  def index
    @places = places_and_visited_count
    @places.each do |place|
      place[2] = total_time_spent_in_place(place[0])
      place[3] = median_time_spent_in_place(place[0])
      place[4] = average_time_spent_in_place(place[0])
    end
  end

  def show
    @place = Place.find_by_name(params[:id])
    @coming_from = most_common_prev_place(@place.name)
  end

  private

  def most_common_prev_place place_name
    prev_names = []
    prev_name = nil

    Place.all.each do |place|
      prev_name = place.name unless place.name.eql? place_name
      prev_names.push prev_name if place.name.eql? place_name
    end

    prev_names.group_by{|n|n}.values.max_by(&:size).first
  end

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

    total_duration.round(2)
  end

  def median_time_spent_in_place place_name
    all_durations = array_of_all_durations(place_name).sort
    len = all_durations.length
    ((all_durations[(len - 1) / 2] + all_durations[len / 2]) / 2.0).round(2)
  end

  def average_time_spent_in_place place_name
    all_durations = array_of_all_durations(place_name)
    (all_durations.inject{ |sum, el| sum + el }.to_f / all_durations.size).round(2)
  end

  def array_of_all_durations place_name
    all_durations = []

    Place.where(name: place_name).each do |place|
      all_durations.push place.duration.to_i
    end

    all_durations
  end
end
