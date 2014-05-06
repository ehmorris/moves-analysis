class ChangeCrimeToPlaces < ActiveRecord::Migration
  def change
    drop_table :crimes
    create_table :places do |t|
      t.string :Date
      t.string :Name
      t.string :Start
      t.string :End
      t.string :Duration
      t.string :Latitude
      t.string :Longtitude
      t.string :Category
      t.string :Link
    end
  end
end
