class FixTypo < ActiveRecord::Migration
  def change
    rename_column :places, :Longtitude, :Longitude
  end
end
