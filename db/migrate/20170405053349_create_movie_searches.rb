class CreateMovieSearches < ActiveRecord::Migration
  def change
    create_table :movie_searches do |t|
      t.string :search_term
      t.integer :count, default: 0

      t.timestamps null: false
    end
  end
end
