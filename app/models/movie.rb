class Movie < ActiveRecord::Base
  validates_presence_of :title, :source


  belongs_to :genre
  belongs_to :country
  #has_many :movies_people
  #has_many :writers, through: :movies_people
  has_and_belongs_to_many :writers, :association_foreign_key => :person_id, :class_name => "Writer"
  has_and_belongs_to_many :directors, :association_foreign_key => :person_id, :class_name => "Director"
  has_and_belongs_to_many :actors, :association_foreign_key => :person_id, :class_name => "Actor"
end
