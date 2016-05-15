require 'rails_helper'

RSpec.describe "movies/index.html.erb", type: :view do
  before do
    @movie1 = build_stubbed(:movie)
    @movie2 = build_stubbed(:movie)
    assign(:movies, [ @movie1, @movie2 ])
  end
  it "displays all the movies" do
    render

    expect(rendered).to include(@movie1.title, @movie2.title)
  end
end
