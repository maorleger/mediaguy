class Director < ActiveRecord::Base
  validates_presence_of :first_name, :last_name

  def to_s
    "#{first_name} #{last_name}"
  end
end
