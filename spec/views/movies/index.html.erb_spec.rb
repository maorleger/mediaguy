require 'rails_helper'

RSpec.describe 'movies/index.html.erb', type: :view do
  it 'displays all the movies' do
    @movie1 = create(:movie)
    @movie2 = create(:movie)
    assign(:movies, [@movie1, @movie2])

    render

    expect(rendered).to include(@movie1.title, @movie2.title)
  end
end
