require 'httparty'
class MoviesController < ApplicationController
  include HTTParty

  def index
      if params[:search]
        response = HTTParty.get('https://www.omdbapi.com/?s=' + params[:search] + '&r=json')
        if response.success?
          search = response["Search"]
          @movies = []
          search.each do |movie|
              mov = Movie.find_or_create_by(imdbid: movie['imdbID']) do |new_movie|
              new_movie.title = movie["Title"]
              if movie["Poster"] != nil
                new_movie.poster = movie["Poster"]
              end
              new_movie.year = movie["Year"]
            end
            @movies << mov
          end
        else
          p 'error'
        end
      else
        @movies = Movie.all
      end
  end

  def show
    @movie = Movie.find(params[:movie_id])
    movie_response = HTTParty.get('https://www.omdbapi.com/?t=' + @movie.title + '&y=&plot=full&r=json')
    @plot = movie_response["Plot"]
    @genre = movie_response["Genre"]
    @reviews = @movie.reviews
    @reviews.each do |review|
    @user = User.find_by_id(review.user_id)
  end
    @rating = Rating.where(movie_id: @movie.id, user_id: current_user.id).first
    unless @rating
      @rating = Rating.create(movie_id: @movie.id, user_id: current_user.id, score: 0)
    end
    render :show
  end

end
