class HomeController < ApplicationController
  def index
    search_term = params[:q]

    if search_term.present?
      # Truncate the search term if someone is trying to be silly
      search_term = search_term[0..250]
      @search_term = search_term
      @search_results = OpenMovieDatabase.movie_search(@search_term)[:Search]
      MovieSearch.add_or_increment(@search_term) if @search_results.present?
    end

    # Just return the 50 most recent movie searches
    @past_searches = MovieSearch.all.order(updated_at: :desc).limit(50)
  end
end
