class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :rated
      t.date :released
      t.integer :runtime
      t.references :genre, index: true, foreign_key: true
      t.text :plot
      t.references :country, index: true, foreign_key: true
      t.integer :metascore
      t.integer :imdb_rating
      t.integer :imdb_votes
      t.string :type

      t.timestamps null: false
    end
  end
end
