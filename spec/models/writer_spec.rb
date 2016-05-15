require 'rails_helper'

RSpec.describe Writer, type: :model do
  it 'has a valid factory' do
    expect(build_stubbed(:writer)).to be_valid
  end

  it 'can join to movies' do
    movie = build_stubbed(:movie)
    expect(create(:writer, movies: [movie])).to eq([movie])
  end
end
