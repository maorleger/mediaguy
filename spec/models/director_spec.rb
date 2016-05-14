require 'rails_helper'

RSpec.describe Director, type: :model do
  it 'has a valid factory' do
    expect(create(:director)).to be_valid
  end

  it 'is invalid without a first name' do
    expect(build_stubbed(:director, first_name: nil)).not_to be_valid
  end

  it 'is invalid without a last name' do
    expect(build_stubbed(:director, last_name: nil)).not_to be_valid
  end
  it 'returns the director full name as a string' do
    director = build_stubbed(:director)
    expect(director.to_s).to eq("#{director.first_name} #{director.last_name}")
  end
end
