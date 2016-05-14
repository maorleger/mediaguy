class Genre < ActiveRecord::Base
  validates_presence_of :genre

  def to_s
    genre
  end
end
