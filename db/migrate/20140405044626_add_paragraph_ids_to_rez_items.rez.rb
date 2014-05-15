# This migration comes from rez (originally 20140128123551)
class AddParagraphIdsToRezItems < ActiveRecord::Migration
  def change
    add_column :rez_items, :paragraph_ids, :integer, array: true, default: []
  end
end
