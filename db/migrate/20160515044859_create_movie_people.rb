class CreateMoviesPeople < ActiveRecord::Migration
  def change
    create_table :movie_people, :id => false do |t|
      t.integer :movie_id
      t.integer :person_id
    end
  end
end
