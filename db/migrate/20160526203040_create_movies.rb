class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :genre
      t.string :poster
      t.string :plot


      t.timestamps null: false
    end
  end
end
