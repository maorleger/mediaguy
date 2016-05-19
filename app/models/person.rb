class Person < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  has_and_belongs_to_many :movies

  def to_s
    "#{first_name} #{last_name}"
  end
end
