class SearchController < ApplicationController
  def search
    search_param = params[:name]
    @results = []
    local_movies = Movie.where('title like ?', "%#{search_param}%").to_a
    @results += local_movies if local_movies
  end
end
