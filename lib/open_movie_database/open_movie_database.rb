class OpenMovieDatabase
  def self.movie_search(movie)
    # Encode whitespace with %20
    movie = URI.escape(movie)

    # Just return the first page as it gets really slow if you search for something very generic
    movie_query = "http://www.omdbapi.com/?s=#{movie}&type=movie&page=1"
    response = RestClient.get(movie_query)

    data = nil
    # If the response is valid then parse it into JSON
    if response.present? && good_status?(response.code)
      data = JSON.parse(response.body) if response.body.present?
    end
    convert_to_mash(data)
  end

  private

  def self.good_status?(response_code)
    response_code == 200 || response_code == 201 || response_code == 204
  end

  def self.convert_to_mash(data)
    if data.is_a? Hash
      Hashie::Mash.new(data)
    elsif data.is_a? Array
      data.map { |d| Hashie::Mash.new(d) }
    end
  end
end
