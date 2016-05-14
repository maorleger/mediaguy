require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "is called when visiting route" do
      expect(get: root_url).to route_to("movies#index")
    end
  end

end
