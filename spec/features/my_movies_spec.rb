require 'rails_helper'

RSpec.feature 'my movies' do
  before do
    @movie1 = create(:movie)
    @movie2 = create(:movie)
  end

  it 'shows my local movies' do
    visit '/'

    expect(page).to have_link('My Movie Library')

    click_link 'My Movie Library'

    expect(page).to have_content(@movie1.title)
    expect(page).to have_content(@movie2.title)
  end
end
