require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'has a valid factory' do
    expect(build_stubbed(:movie)).to be_valid
  end
end
