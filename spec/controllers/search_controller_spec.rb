require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #search' do
    before do
      @movie = create(:movie)
      @movie_prefix = create(:movie, title: 'maorleger', source: 'DVD')
      @movie_prefix2 = create(:movie, title: 'maorleger', source: 'BLURAY')
    end

    it 'returns http success' do
      get :search
      expect(response).to have_http_status(:success)
    end

    it 'works' do
      get :search
      expect(assigns[:results]).to have_key(:local)
    end

    context 'with streaming turned on' do
      it 'works' do
        get :search, include_streaming: true
        expect(assigns[:results]).to have_key(:streaming)
        expect(assigns[:results]).to have_key(:local)
      end

      it 'can search canistreamit' do
        get :search, name: 'goodfellas', include_streaming: true
        # TODO: fix this test once i decide on an interface for canistreamit
        expect(assigns[:results][:movie]).to match(a_hash_including('title' => 'GoodFellas'))
      end

      it 'returns an empty hash if nothing is found' do
        get :search, name: 'flkjdsfljdslkf', include_streaming: true
        expect(assigns[:results][:streaming]).to eq([])
      end
    end

    it 'can search your local library' do
      get :search, name: @movie.title
      expect(assigns[:results][:local]).not_to be_nil
      expect(assigns[:results][:local]).to eq(['DVD'])
    end

    it 'can return multiple movies by prefix' do
      get :search, name: 'maorleger'
      expect(assigns[:results][:local]).not_to be_nil
      expect(assigns[:results][:local]).to eq([@movie_prefix.source, @movie_prefix2.source])
    end

    it 'returns an empty array if no movies are found' do
      get :search, name: 'fuzzywazzywashe'
      expect(assigns[:results][:local]).to eq([])
    end
  end
end
