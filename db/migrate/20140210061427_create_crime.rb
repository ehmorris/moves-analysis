class CreateCrime < ActiveRecord::Migration
  def change
    create_table :crime do |t|
      t.string :FROMDATE
      t.string :TODATE
      t.string :WEAPONTYPE
      t.string :BUILDINGTYPE
      t.string :PLACEOFENTRY
      t.string :SUSPECTTRANSPORTATION
      t.string :VICTIMACTIVITY
      t.string :UNUSUALACTIONS
      t.string :WEATHER
      t.string :NEIGHBORHOOD
      t.string :LIGHTING
      t.string :DOMESTIC
      t.string :WEAPOND_TYPE
      t.string :DAY_WEEK
      t.string :COMPUTEDCRIMECODEDESC
      t.string :STREETNAME
      t.string :XSTREETNAME
    end
  end
end
