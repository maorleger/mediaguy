require 'faker'
FactoryGirl.define do
  factory :director do |d|
    d.first_name { Faker::Name.first_name }
    d.last_name { Faker::Name.last_name }
  end
end