class MovieSearch < ActiveRecord::Base
  def self.add_or_increment(search_term)
    movie_search = MovieSearch.where(search_term: search_term).first

    if movie_search.present?
      # Just increment it
      movie_search.count += 1
      movie_search.save!
    else
      # Create a new one
      MovieSearch.create({
        search_term: search_term,
        count: 1
      })
    end
  end
end
