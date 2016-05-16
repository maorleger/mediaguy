require 'rails_helper'

RSpec.describe "movies/index.html.erb", type: :view do
  before do
  end
  it "displays all the movies" do
    @movie1 = build_stubbed(:movie)
    @movie2 = build_stubbed(:movie)
    assign(:movies, [ @movie1, @movie2 ])

    render

    expect(rendered).to include(@movie1.title, @movie2.title)

  end
end
