require 'rails_helper'

RSpec.feature 'homepage' do
  scenario 'routes to movies#index' do
    expect(get("/")).to route_to("movies#index")
  end
end