class Movie < ActiveRecord::Base
  validates :title, :source, presence: true

  belongs_to :genre
  belongs_to :country
  # has_many :movies_people
  # has_many :writers, through: :movies_people
  has_and_belongs_to_many :writers, association_foreign_key: :person_id, class_name: 'Writer'
  has_and_belongs_to_many :directors, association_foreign_key: :person_id, class_name: 'Director'
  has_and_belongs_to_many :actors, association_foreign_key: :person_id, class_name: 'Actor'

  def details
    simple_attrs = attributes.except('title', 'id', 'genre_id', 'country_id', 'created_at', 'updated_at')
    add_relations(simple_attrs)
  end

  private

  def add_relations(attributes)
    attributes.merge!(
      genre: genre.to_s,
      country: country.to_s,
      writers: writers.map(&:to_s).join(', '),
      directors: directors.map(&:to_s).join(', '),
      actors: actors.map(&:to_s).join(', ')
    )
  end
end
