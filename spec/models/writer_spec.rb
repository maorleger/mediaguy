require 'rails_helper'

RSpec.describe Writer, type: :model do
  it 'has a valid factory' do
    expect(build_stubbed(:writer)).to be_valid
  end
end
