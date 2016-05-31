require 'httparty'
class MoviesController < ApplicationController
  include HTTParty


  def index
    if params[:search]
    response = HTTParty.get('https://www.omdbapi.com/?s=' + params[:search] + '&r=json')
    pars = response.parsed_response
    search = pars["Search"]
      @movies = []
      search.each do |movie|
      @movie = Movie.new
      @movie.title = movie["Title"]
      @movie.poster = movie["Poster"]
      @movie.year = movie["Year"]
      @movies << @movie
    end
  else
    response = HTTParty.get('https://www.omdbapi.com/?s=' + 'cool' + '&r=json')
    pars = response.parsed_response
    search = pars["Search"]
      @movies = []
      search.each do |movie|
      @movie = Movie.new
      @movie.title = movie["Title"]
      @movie.poster = movie["Poster"]
      @movie.year = movie["Year"]
      @movies << @movie
      end
    end
  end
end
