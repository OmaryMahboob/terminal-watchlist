require_relative "../models/movie"
require "json"
require "open-uri"

class MoviesApi
  def query(query)
    apikey = "c3fd5fa01e24b7e141f70e6fccfcb2cb"
    url = "https://api.themoviedb.org/3/movie/550?api_key=#{apikey}&query=#{query}"
    movie_serialized = URI.open(url).read
    response = JSON.parse(movie_serialized["results"])
    filter_response(response)
  end

  private
  def filter_response(data)
    data.map do |film|
      Movie.new({
        name: film["original_title"],
        description: film["overview"],
        rating: film["vote_average"],
        year: film["release_date"].split("-").first
      })
    end
  end
end
