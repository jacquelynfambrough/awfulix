class CreateMovies < ActiveRecord::Migration[5.2]
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
