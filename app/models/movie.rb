class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  has_many :ratings

  def average_rating
    if ratings.size == 0
      @divideBy = 1
    else
      @divideBy = ratings.size
    end
     ratings.sum(:score) / @divideBy
  end
end
