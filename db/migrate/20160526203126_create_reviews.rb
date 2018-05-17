class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.string :subject
      t.integer :user_id
      t.integer :movie_id

      t.timestamps null: false
    end
  end
end
