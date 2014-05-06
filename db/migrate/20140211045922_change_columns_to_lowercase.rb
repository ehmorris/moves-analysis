class ChangeColumnsToLowercase < ActiveRecord::Migration
  def change
    rename_column :crimes, :FROMDATE, :fromdate
    rename_column :crimes, :TODATE, :todate
    rename_column :crimes, :WEAPONTYPE, :weapontype
    rename_column :crimes, :BUILDINGTYPE, :buildingtype
    rename_column :crimes, :PLACEOFENTRY, :placeofentry
    rename_column :crimes, :SUSPECTTRANSPORTATION, :suspecttransportation
    rename_column :crimes, :VICTIMACTIVITY, :victimactivity
    rename_column :crimes, :UNUSUALACTIONS, :unusualactions
    rename_column :crimes, :WEATHER, :weather
    rename_column :crimes, :NEIGHBORHOOD, :neighborhood
    rename_column :crimes, :LIGHTING, :lighting
    rename_column :crimes, :DOMESTIC, :domestic
    rename_column :crimes, :WEAPON_TYPE, :weapon_type
    rename_column :crimes, :DAY_WEEK, :day_week
    rename_column :crimes, :COMPUTEDCRIMECODEDESC, :computedcrimecodedesc
    rename_column :crimes, :STREETNAME, :streetname
    rename_column :crimes, :XSTREETNAME, :xstreetname
  end
end
