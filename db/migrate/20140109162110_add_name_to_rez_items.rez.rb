# This migration comes from rez (originally 20140109160206)
class AddNameToRezItems < ActiveRecord::Migration
  def change
    add_column :rez_items, :name, :text
  end
end
