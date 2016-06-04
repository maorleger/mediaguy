class SearchController < ApplicationController
  def search
    search_param = params[:name] || ''
    include_streaming = params[:include_streaming]
    @client = Canistreamit::Client.new
    @results = results(search_param, include_streaming)
  end

  def default_results_hash
    {
      movie: {},
      local: [],
      streaming: []
    }
  end

  private

  def results(search_text, include_streaming)
    results = default_results_hash
    movie = find_movie(search_text)
    return results unless movie
    results[:movie] = movie
    results[:local] = local_results(movie['title'])
    results[:streaming] = canistreamit_results(movie['_id']) if include_streaming && movie['_id']
    results
  end

  def find_movie(search_text)
    # first try to find it on canistreamit
    # if you cant find it there try to find it locally
    movie = @client.search(search_text)
    return movie[0] unless movie.empty?
    Movie.where('lower(title) = ?', search_text.downcase).first
  end

  def local_results(search_text)
    local_movies = Movie.where('lower(title) = ?', search_text.downcase)
    local_movies.map(&:source)
  end

  def canistreamit_results(movie_id)
    @client.query(movie_id, %w(streaming xfinity))
  end

  def canistreamit_movie(search_text)
    @client.search(search_text)
  end
end
