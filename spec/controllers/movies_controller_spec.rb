require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe 'GET #index' do

    before do
      #@director = create(:director, first_name: "Maor", last_name: "Leger")
      #@movie = create(:movie, title: "Frozen", year: 2013, rated: "PG", )
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'is called when visiting route' do
      expect(get: root_url).to route_to("movies#index")
    end

    it 'gets all local movies'


  end

end
