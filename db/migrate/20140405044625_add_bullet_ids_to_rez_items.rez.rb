# This migration comes from rez (originally 20140124021253)
class AddBulletIdsToRezItems < ActiveRecord::Migration
  def change
    add_column :rez_items, :bullet_ids, :integer, array: true, default: []
  end
end
