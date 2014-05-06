class ChangeCrimeToCrimes < ActiveRecord::Migration
  def change
    rename_table :crime, :crimes
  end
end
