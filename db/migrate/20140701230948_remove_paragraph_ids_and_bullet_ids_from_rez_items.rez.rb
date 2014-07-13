# This migration comes from rez (originally 20140628062611)
class RemoveParagraphIdsAndBulletIdsFromRezItems < ActiveRecord::Migration
  def change
    remove_column :rez_items, :paragraph_ids
    remove_column :rez_items, :bullet_ids
  end
end
