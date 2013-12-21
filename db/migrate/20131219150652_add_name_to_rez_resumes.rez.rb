# This migration comes from rez (originally 20131218122726)
class AddNameToRezResumes < ActiveRecord::Migration
  def change
    add_column :rez_resumes, :name, :text
  end
end
