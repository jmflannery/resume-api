# This migration comes from rez (originally 20131215033101)
class CreateRezResumes < ActiveRecord::Migration
  def change
    create_table :rez_resumes do |t|
      t.references :profile
      t.references :address

      t.timestamps
    end
  end
end
