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

    next_prev = most_common_next_prev_place(@place.name)
    @coming_from = next_prev['prev']
    @left_for = next_prev['next']
  end

  private

  def most_common_next_prev_place place_name
    prev_names = []
    next_names = []
    prev_name  = nil
    next_name  = nil

    Place.all.each_with_index do |place, index|
      if index > 0 && prev_name.nil?
        next_names.push place.name
        prev_name = place.name
      end

      if place.name.eql? place_name
        prev_names.push prev_name
        prev_name = nil
      else
        prev_name = place.name
      end
    end

    most_common_prev_place = most_common_value(prev_names, place_name)
    most_common_next_place = most_common_value(next_names, place_name)

    { 'prev' => most_common_prev_place,
      'next' => most_common_next_place }
  end

  def most_common_value values, disqualified_word
    values.delete(disqualified_word)
    most_common_value_and_all_occurances = 
      values.group_by{|x|x}.values.max_by(&:size)

    { 'place' => most_common_value_and_all_occurances.first,
      'count' => most_common_value_and_all_occurances.count }
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
