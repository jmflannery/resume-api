# This migration comes from rez (originally 20140107135424)
class CreateRezItems < ActiveRecord::Migration
  def change
    create_table :rez_items do |t|
      t.text :title
      t.text :heading

      t.timestamps
    end
  end
end
