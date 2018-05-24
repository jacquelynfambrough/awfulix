class AddDetailsToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :maturity_rating, :string
    add_column :movies, :media_type, :string
    add_column :movies, :runtime, :string
    add_column :movies, :director, :string
    add_column :movies, :actors, :string
    add_column :movies, :language, :string
    add_column :movies, :country, :string
    add_column :movies, :imdb_rating, :decimal
    add_column :movies, :rotten_rating, :decimal
    add_column :movies, :metacritic_rating, :decimal
  end
end
