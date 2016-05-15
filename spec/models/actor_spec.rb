require 'rails_helper'

RSpec.describe Actor, type: :model do
  it 'has a valid factory' do
    expect(build_stubbed(:actor)).to be_valid
  end
end