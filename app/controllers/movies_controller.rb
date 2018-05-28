require 'httparty'
class MoviesController < ApplicationController
  include HTTParty

  def index
      if params[:search]
        # search params only pull up these attributes: title, year, imdbid, type & poster
        search_response = HTTParty.get('https://www.omdbapi.com/?apikey=' + Rails.application.credentials[:ombd_api_key] + '&s=' + params[:search] + '&r=json')
        # if response is success, insert movies pulled up in search into empty array
        if search_response.success?
          search = search_response["Search"]
          @movies = [] #empty array to insert search results
          search.each do |search_result_item|
              mov = Movie.find_or_create_by(imdbid: search_result_item['imdbID']) do |new_movie| # create list of movies found based off of search parameters
                new_movie.title = search_result_item["Title"]
                new_movie.poster = search_result_item["Poster"]
                new_movie.year = search_result_item["Year"]
              end # end "new_movie" iteration
              @movies << mov # push search result into array
          end #end "search_result_item" iteration

        else # if search_response fails, throw error
          p 'error'

        end # end search_response if-case
      else # if no search params, display all movies in database.
        @movies = Movie.all
      end # end search params if-case
  end # end 'def index'

  def show
    @movie = Movie.find(params[:movie_id])
    movie_response = HTTParty.get('https://www.omdbapi.com/?apikey=' + Rails.application.credentials[:ombd_api_key] + '&t=' + @movie.title + '&y=&plot=full&r=json')
    movie_response_short_plot = HTTParty.get('https://www.omdbapi.com/?apikey=' + Rails.application.credentials[:ombd_api_key] + '&t=' + @movie.title + '&y=&r=json')
    @plotShort = movie_response_short_plot["Plot"]
    @plotFull = movie_response
    @genre = movie_response["Genre"]
    @maturityRating = movie_response["Rated"]
    # @rottenRating = movie_response["Plot"]
    # @imdbRating = movie_response["Plot"]
    @reviews = @movie.reviews
    @reviews.each do |review|
    @user = User.find_by_id(review.user_id)
  end

    if @rating == true # if there is a rating, display the rating, otherwise, set rating score to 0
      if @user == true  # if the user is logged in, tie in user id to allow contribution to rating score, if not, simply show the rating
        @rating = Rating.where(movie_id: @movie.id, user_id: current_user.id).first
      else
        @rating = Rating.where(movie_id: @movie.id).first
      end #end secondary if case for existence of user
    else
      if @user == true
        @rating = Rating.create(movie_id: @movie.id, user_id: current_user.id, score: 0)
      else
        @rating = Rating.create(movie_id: @movie.id, score: 0)
      end #end secondary if case for existence of user
    end
    render :show
  end #end to main if case for review score

end
