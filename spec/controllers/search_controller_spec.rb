require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #search' do
    before do
      @movie = create(:movie)
      @movie_prefix = create(:movie, title: 'maor 1')
      @movie_prefix2 = create(:movie, title: 'maor 2')
    end

    it 'returns http success' do
      get :search
      expect(response).to have_http_status(:success)
    end

    it 'can search your local library' do
      get :search, name: @movie.title
      expect(assigns(:results)).not_to be_nil
      expect(assigns(:results)).to eq([@movie])
    end

    it 'can return multiple movies by prefix' do
      get :search, name: 'maor'
      expect(assigns(:results)).not_to be_nil
      expect(assigns(:results)).to eq([@movie_prefix, @movie_prefix2])
    end

    it 'returns an empty array if no movies are found' do
      get :search, name: 'fuzzywazzywashe'
      expect(assigns[:results]).to eq([])
    end

    it 'can search canistreamit' do
      get :search, name: 'goodfellas', include_streaming: true
      # TODO: fix this test once i decide on an interface for canistreamit
      expect(assigns[:results][0]['movie']).to include('title' => 'GoodFellas')
    end
  end
end
