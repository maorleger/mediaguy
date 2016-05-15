class RenameMovieType < ActiveRecord::Migration
  def change
    rename_column :movies, :type, :source
  end
end
