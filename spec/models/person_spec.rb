require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'has a valid factory' do
    expect(build_stubbed(:person)).to be_valid
  end

  it 'is invalid without a first name' do
    expect(build_stubbed(:person, first_name: nil)).not_to be_valid
  end

  it 'is invalid without a last name' do
    expect(build_stubbed(:person, last_name: nil)).not_to be_valid
  end

  it 'returns the director full name as a string' do
    director = build_stubbed(:person)
    expect(director.to_s).to eq("#{director.first_name} #{director.last_name}")
  end
end
