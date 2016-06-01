require 'httparty'
class MoviesController < ApplicationController
  include HTTParty

  def index
      if params[:search]
        response = HTTParty.get('https://www.omdbapi.com/?s=' + params[:search] + '&r=json')
        if response.success?
          search = response["Search"]
          p "search is:", search
          @movies = []
          search.each do |movie|
              p "iterating.. ", movie
              mov = Movie.find_or_create_by(imdbid: movie['imdbID']) do |new_movie|
              new_movie.title = movie["Title"]
              if movie["Poster"] != nil
                new_movie.poster = movie["Poster"]
              end
              new_movie.year = movie["Year"]
              new_movie.plot = movie["Plot"]
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
    @movie = Movie.find(params[:id])
    render :show
  end
end
