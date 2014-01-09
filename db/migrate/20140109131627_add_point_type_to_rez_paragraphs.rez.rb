# This migration comes from rez (originally 20140107213432)
class AddPointTypeToRezParagraphs < ActiveRecord::Migration
  def change
    add_column :rez_paragraphs, :point_type, :text
  end
end
