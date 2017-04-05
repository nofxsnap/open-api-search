class CreateMovieSearches < ActiveRecord::Migration
  def change
    create_table :movie_searches do |t|
      t.string :search_term
      t.integer :count
      t.datetime :last_searched

      t.timestamps null: false
    end
  end
end
