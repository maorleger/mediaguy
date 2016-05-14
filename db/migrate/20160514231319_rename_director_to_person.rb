class RenameDirectorToPerson < ActiveRecord::Migration
  def change
    rename_table :directors, :people
  end
end
