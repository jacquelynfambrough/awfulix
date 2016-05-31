class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  attr_accessor :title, :plot, :genre, :year, :poster
end
