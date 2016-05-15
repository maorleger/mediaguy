class Person < ActiveRecord::Base
  has_and_belongs_to_many :movies
  validates_presence_of :first_name, :last_name

  def to_s
    "#{first_name} #{last_name}"
  end
end
