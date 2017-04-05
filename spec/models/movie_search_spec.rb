require "spec_helper"

describe MovieSearch do
  it "should be able to create a new MovieSearch" do
    MovieSearch.create({search_term: "logan", count: 1})
    expect(MovieSearch.all.count).to be == 1
  end

  it "should increment the count if searched multiple times" do
    MovieSearch.add_or_increment("logan")
    expect(MovieSearch.where(search_term: "logan").count).to be == 1

    MovieSearch.add_or_increment("logan")
    expect(MovieSearch.where(search_term: "logan").first.count).to be == 2

    MovieSearch.add_or_increment("logan")
    expect(MovieSearch.where(search_term: "logan").first.count).to be == 3
  end

  it "should not allow a giant string for a search term" do
    long_search_term = "logan" * 100
    MovieSearch.add_or_increment(long_search_term)
    expect(MovieSearch.all.count).to be == 0
  end

  it "should return recent results" do
    MovieSearch.add_or_increment("logan")
    results = MovieSearch.get_recent_results(1)
    expect(results.count).to be == 1
  end
end
