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
end
