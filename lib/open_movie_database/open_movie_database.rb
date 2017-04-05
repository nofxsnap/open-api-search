class OpenMovieDatabase
  def self.movie_search(movie)
    response = RestClient.get "http://www.omdbapi.com/?s=#{movie}&type=movie&page=1"
    if response.present? && good_status?(response.code)
      JSON.parse(response.body) if response.body.present?
    else
      nil
    end
  end

  private

  def self.good_status?(response_code)
    response_code == 200 || response_code == 201 || response_code == 204
  end
end
