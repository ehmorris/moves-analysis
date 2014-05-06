class Lowercase < ActiveRecord::Migration
  def change
    rename_column :places, :Date, :date
    rename_column :places, :Name, :name
    rename_column :places, :Start, :start
    rename_column :places, :End, :end
    rename_column :places, :Duration, :duration
    rename_column :places, :Latitude, :latitude
    rename_column :places, :Longitude, :longitude
    rename_column :places, :Category, :category
    rename_column :places, :Link, :link
  end
end
