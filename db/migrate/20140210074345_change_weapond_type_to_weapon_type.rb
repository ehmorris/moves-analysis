class ChangeWeapondTypeToWeaponType < ActiveRecord::Migration
  def change
    rename_column :crimes, :WEAPOND_TYPE, :WEAPON_TYPE
  end
end
