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
    m.title { Faker::Book.title }
    m.year { 2016 }
    m.rated { %w(PG R NC17).sample }
    m.released { Faker::Date.between(2.years.ago, 2.years.from_now) }
    m.runtime { rand(1..120) }
    m.genre { create(:genre) }
    m.plot { Faker::Hipster.sentence }
    m.country { create(:country) }
    m.metascore { rand(1...100) }
    m.imdb_rating { rand(1..10) }
    m.imdb_votes { rand(1...1_000_000) }
    m.source { 'DVD' }
    m.directors { [create(:director)] }
  end
end
