require 'rails_helper'

RSpec.describe Genre, type: :model do
  it 'has a valid factory' do
    expect(create(:genre)).to be_valid
  end

  it 'is invalid without a genre' do
    expect(build_stubbed(:genre, genre: nil)).not_to be_valid
  end

  it 'returns the genre as string' do
    genre = build_stubbed(:genre)
    expect(genre.to_s).to eq(genre.genre)
  end
end
