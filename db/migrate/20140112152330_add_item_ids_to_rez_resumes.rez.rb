# This migration comes from rez (originally 20140112041007)
class AddItemIdsToRezResumes < ActiveRecord::Migration
  def change
    add_column :rez_resumes, :item_ids, :integer, array: true, default: []
  end
end
