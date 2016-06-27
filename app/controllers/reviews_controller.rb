class ReviewsController < ApplicationController

  def index
    @review_all = Review.all

  end

  def new
    @movie = Movie.find(params[:id])
    @review = Review.new
    @rating = Rating.create(movie_id: @movie.id, user_id: current_user.id, score: 0)

    render :new
  end

  def create
    @review = Review.new(review_params)
    @rating = Rating.find(params[:id])
    @rating.update_attributes(score: params[:score])
    @user = current_user
    @movie = Movie.find(params[:id])
    @movie.reviews << @review
    @user.reviews << @review
    @movie.ratings << @rating
    @user.ratings << @rating
    @movie.save
    @user.save
    # @review.save

    redirect_to movie_reviews_path(@movie)
  end

  def edit
    @review = Review.find(params[:id])
    @movie = Movie.find_by_id(@review.movie_id)
    render :edit
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @review.update_attributes(review_params)


    redirect_to movie_reviews_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @review.destroy

    redirect_to movie_path(@movie)
  end


  private
  def review_params
    params.require(:review).permit(:content, :rating, :subject)
  end
end
