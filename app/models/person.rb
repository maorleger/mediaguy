class Person < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  has_and_belongs_to_many :movies

  def to_s
    "#{first_name} #{last_name}"
  end
end
