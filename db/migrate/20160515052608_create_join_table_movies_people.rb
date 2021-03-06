class CreateJoinTableMoviesPeople < ActiveRecord::Migration
  def change
    create_join_table :movies, :people do |t|
      t.index [:movie_id, :person_id]
      t.index [:person_id, :movie_id]
    end
  end
end
