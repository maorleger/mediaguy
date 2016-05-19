require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe 'GET #index' do
    before do
      @movie = create(:movie)
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'is called when visiting route' do
      expect(get: root_url).to route_to('movies#index')
    end

    it 'gets all local movies' do
      get :index
      expect(assigns(:movies)).not_to be_nil
      expect(assigns(:movies)).to eq([@movie])
    end
  end
end
