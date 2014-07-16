# This migration comes from rez (originally 20140714225502)
class RemoveItemIdsFromRezResumes < ActiveRecord::Migration
  def change
    remove_column :rez_resumes, :item_ids
  end
end
