class HomeController < ApplicationController
  def index
    search_term = params[:q]

    if search_term.present?
      @search_term = search_term
      @search_results = OpenMovieDatabase.movie_search(@search_term)[:Search]
      MovieSearch.add_or_increment(@search_term) if @search_results.present?
    end
  end
end
