class ChangeDataTypesForMovieRatings < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :imdb_rating, :string
    change_column :movies, :rotten_rating, :string
    change_column :movies, :metacritic_rating, :string
  end
end
