require 'faker'
FactoryGirl.define do
  factory :person do |d|
    d.first_name { Faker::Name.first_name }
    d.last_name { Faker::Name.last_name }

    factory :director, class: Director do

    end
  end
end