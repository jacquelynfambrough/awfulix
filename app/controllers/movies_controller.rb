require 'httparty'
class MoviesController < ApplicationController
  include HTTParty


  def index
    if params[:search]
    response = HTTParty.get('https://www.omdbapi.com/?s=' + params[:search] + '&r=json')
    pars = response.parsed_response
      @movies = []
      pars.Search.each do |movie|
      @movie = Movie.new
      @movie.title = movie.Title
      @movies << @movie
    end
  else
    response = HTTParty.get('https://www.omdbapi.com/?s=' + 'cool' + '&r=json')
    pars = response.parsed_response
      @movies = []
      pars.Search.each do |movie|
      @movie = Movie.new
      @movie.title = movie.Title
      @movies << @movie
      end
    end
  end
end
