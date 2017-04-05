class MovieSearch < ActiveRecord::Base
  validates :search_term, presence: true, length: { maximum: 250 }

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

  def self.get_recent_results(number_of_results)
    MovieSearch.all.order(updated_at: :desc).limit(number_of_results)
  end
end
