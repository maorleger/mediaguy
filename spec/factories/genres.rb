FactoryGirl.define do
  factory :genre do |g|
    g.genre { Faker::Book.genre }
  end
end