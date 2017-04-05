require "spec_helper"

describe OpenMovieDatabase do
  it "should have be able to search for a movie and return results" do
    results = OpenMovieDatabase.movie_search("logan")
    expect(results.present?).to be_true
  end

  it "should return more than one result for a generic search" do
    results = OpenMovieDatabase.movie_search("the")
    expect(results.count).to be > 1
  end
end
