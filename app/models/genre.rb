class Genre < ActiveRecord::Base
  validates :genre, presence: true

  def to_s
    genre
  end
end
