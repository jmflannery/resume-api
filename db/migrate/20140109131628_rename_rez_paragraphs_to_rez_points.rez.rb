# This migration comes from rez (originally 20140108014133)
class RenameRezParagraphsToRezPoints < ActiveRecord::Migration
  def change
    rename_table :rez_paragraphs, :rez_points
  end
end
