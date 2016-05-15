require 'faker'
FactoryGirl.define do
  factory :country do |c|
    c.code { Faker::Address.country_code }
    c.description { Faker::Address.country }
  end

  factory :genre do |g|
    g.genre { Faker::Book.genre }
  end

  factory :person do |d|
    d.first_name { Faker::Name.first_name }
    d.last_name { Faker::Name.last_name }

    factory :director, class: Director
    factory :writer, class: Writer
    factory :actor, class: Actor
  end

  factory :movie do |m|
    
  end
end