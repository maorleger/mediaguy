class Country < ActiveRecord::Base
  validates :code, :description, presence: true
  def to_s
    code
  end
end
