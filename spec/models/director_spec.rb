require 'rails_helper'

RSpec.describe Director, type: :model do
  it 'has a valid factory' do
    expect(build_stubbed(:director)).to be_valid
  end
  it 'can join to movies' do
    movie = build_stubbed(:movie)
    expect(create(:director, movies: [movie]).movies).to eq([movie])
  end
end
