class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  has_many :ratings

  def average_rating
    ratings.sum(:score) / ratings.size
  end
end
