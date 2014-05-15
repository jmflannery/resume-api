# This migration comes from rez (originally 20140128132742)
class RemoveItemIdFromRezPoints < ActiveRecord::Migration
  def change
    remove_column :rez_points, :item_id
  end
end
