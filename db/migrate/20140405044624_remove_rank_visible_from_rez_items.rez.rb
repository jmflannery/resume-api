# This migration comes from rez (originally 20140112213236)
class RemoveRankVisibleFromRezItems < ActiveRecord::Migration
  def change
    remove_column :rez_items, :rank
    remove_column :rez_items, :visible
  end
end
