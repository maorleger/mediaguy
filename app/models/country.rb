class Country < ActiveRecord::Base
  validates_presence_of :code, :description

  def to_s
    code
  end
end
