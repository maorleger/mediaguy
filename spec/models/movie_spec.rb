require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'has a valid factory' do
    expect(build_stubbed(:movie)).to be_valid
  end

  it 'can join to writers' do
    writer = build_stubbed(:writer)
    expect(create(:movie, writers: [writer]).writers).to eq([writer])
  end

  it 'can join to directors' do
    director = build_stubbed(:director)
    expect(create(:movie, directors: [director]).directors).to eq([director])
  end

  it 'can join to actors' do
    actor1 = build_stubbed(:actor)
    actor2 = build_stubbed(:actor)
    expect(create(:movie, actors: [actor1, actor2]).actors).to eq([actor1, actor2])
  end


  it 'handles filtering by type on join tables' do
    a1 = create(:actor)
    a2 = create(:actor)
    w1 = create(:writer)
    m = create(:movie, actors: [a1, a2], writers: [w1], directors: [])
    expect(m.actors).to eq([a1, a2])
    expect(m.writers).to eq([w1])
    expect(m.directors).to eq([])
  end

  it 'is invalid without a title' do
    expect(build_stubbed(:movie, title: nil)).not_to be_valid
  end

  it 'is invalid without a source' do
    expect(build_stubbed(:movie, source: nil)).not_to be_valid
  end
end
