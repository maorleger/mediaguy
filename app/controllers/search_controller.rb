class SearchController < ApplicationController
  def search
    search_param = params[:name]
    include_streaming = params[:include_streaming]
    @results = results(search_param, include_streaming)
  end

  private

  def results(search_text, include_streaming)
    results = local_results(search_text)
    results += canistreamit_results(search_text) if include_streaming
    results
  end

  def local_results(search_text)
    local_movies = Movie.where('title like ?', "%#{search_text}%")
    local_movies.any? ? local_movies.to_a : []
  end

  def canistreamit_results(search_text)
    Canistreamit::Client.new.search_and_query(search_text)
  end
end
