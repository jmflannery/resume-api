# This migration comes from rez (originally 20131210213212)
class ChangeRezProfilesColumnType < ActiveRecord::Migration
  def change
    change_column :rez_profiles, :title, :text
  end
end
