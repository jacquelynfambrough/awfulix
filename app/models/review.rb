class Review < ActiveRecord::Base
  belongs_to :users
  belongs_to :movies
end
