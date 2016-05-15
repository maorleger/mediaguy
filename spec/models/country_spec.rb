require 'rails_helper'

RSpec.describe Country, type: :model do
  it 'has a valid factory' do
    expect(build_stubbed(:country)).to be_valid
  end
  it 'is invalid without a code' do
    expect(build_stubbed(:country, code: nil)).not_to be_valid
  end
  it 'is invalid without a description' do
    expect(build_stubbed(:country, description: nil)).not_to be_valid
  end
  it 'returns the code as a string' do
    country = build_stubbed(:country)
    expect(country.to_s).to eq(country.code)
  end
end
