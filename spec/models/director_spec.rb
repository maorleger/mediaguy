require 'rails_helper'

RSpec.describe Director, type: :model do
  it 'has a valid factory' do
    expect(build_stubbed(:director)).to be_valid
  end
end
