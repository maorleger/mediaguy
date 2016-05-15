require 'rails_helper'

RSpec.describe Actor, type: :model do
  it 'has a valid factory' do
    expect(build_stubbed(:actor)).to be_valid
  end
  it 'can join to movies' do
    movie = build_stubbed(:movie)
    expect(create(:actor, movies: [movie]).movies).to eq([movie])
  end
end