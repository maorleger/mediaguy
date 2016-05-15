class Movie < ActiveRecord::Base
  belongs_to :genre
  belongs_to :country
  has_and_belongs_to_many :writers, association_foreign_key: 'writer_id', join_table: 'movies_writers'
  has_and_belongs_to_many :directors, association_foreign_key: 'director_id', join_table: 'directors_movies'
  has_and_belongs_to_many :actors, association_foreign_key: 'actor_id', join_table: 'actors_movies'
end
