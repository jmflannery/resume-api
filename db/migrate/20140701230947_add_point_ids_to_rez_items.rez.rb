# This migration comes from rez (originally 20140628061501)
class AddPointIdsToRezItems < ActiveRecord::Migration
  def change
    add_column :rez_items, :point_ids, :integer, array: true, default: []
  end
end
