require 'rails_helper'

RSpec.describe Director, type: :model do
  it 'has a valid factory' do
    expect(create(:director)).to be_valid
  end
end
